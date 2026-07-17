# Project: Daily Journal (iOS, SwiftUI)

A journaling app with AI-powered weekly summaries, mood trend detection, and
reflective prompt suggestions. Built with CLEAN architecture + SOLID.

## Architecture

CLEAN architecture, three layers under `Sources/`:

- **`Domain/`** — entities, use case protocols + default implementations,
  repository/AI protocols.
  **Hard rule: files in `Domain/` must never `import UIKit`, `import SwiftUI`,
  `import FoundationModels`, `import SwiftData`, or `import CoreData`.**
  If a Domain file seems to need a framework type, that's a signal the
  abstraction belongs in `Data/` instead — stop and ask before adding the import.

- **`Data/`** — concrete implementations of Domain protocols:
  `SwiftDataJournalRepository`, `FoundationModelsAdapter`, `ClaudeAPIAdapter`.
  Adapters conform to Domain's protocols and must translate underlying errors
  (`URLError`, FoundationModels errors, SwiftData errors) into `RepositoryError`
  or `AIProviderError` at the adapter boundary. Nothing framework-specific
  leaks across into Domain.

- **`Presentation/`** — SwiftUI Views + ViewModels (MVVM). ViewModels depend
  only on Domain use case protocols, injected via initializer. Views never
  call a repository or AI adapter directly — always through a ViewModel.

- **`Composition/`** — the single place that wires concrete `Data/`
  implementations into Domain protocols and injects them into ViewModels
  (e.g. `AppDependencyContainer.swift`). No other file should instantiate a
  concrete repository or AI adapter directly.

## Conventions

- One protocol per capability (ISP). Don't add a method to `WeekSummarizing`
  etc. for a "just this once" convenience — add a new protocol instead.
- Every new use case gets: a protocol, a `Default*` implementation, and a
  `Mock*` conformance in `Tests/Mocks/` for use in tests.
- Naming: `<Verb><Noun>UseCase` for use cases, `<Framework>Adapter` for
  Data-layer AI implementations, `<Storage>Repository` for persistence,
  `<Noun><Verb>ing` (gerund) for narrow capability protocols — AI provider
  roles (`WeekSummarizing`, `MoodTrendDetecting`) and repository capability
  slices (`JournalEntryReading`, `JournalEntryWriting`) alike.
- Dependencies are injected through initializers only — no singletons, no
  service locators, no `.shared` reached for from inside Domain or Presentation.

## AI provider policy

- Default to the on-device `FoundationModelsAdapter` when
  `LanguageModelSession.isAvailable` and the entry set fits the on-device
  token budget (~4K tokens).
- Fall back to `ClaudeAPIAdapter` when on-device is unavailable or the content
  exceeds that budget.
- The decision of which adapter to use lives in `Composition/` or a small
  `AIProviderRouter` in `Data/` — never inside a use case.
- Never call FoundationModels or the Claude API from anywhere except an
  adapter in `Data/`.

## Testing

- Write the test against the use case protocol using a mock repository/mock
  provider *before* writing the concrete implementation.
- Run tests with:
  `xcodebuild test -scheme JournalApp -destination 'platform=iOS Simulator,name=iPhone 16'`
- `Domain/` must stay testable without a simulator — pure Swift only, no
  Xcode-only or UIKit-only APIs.

## Before considering any task done

- No `import` of UI-framework or AI-framework modules inside `Domain/`.
- Every new public protocol has at least one `Mock*` conformance for tests.
- Run the test suite and confirm it passes.
- If a change touches more than one layer, say so explicitly and confirm the
  dependency still points inward (Presentation → Domain ← Data).
