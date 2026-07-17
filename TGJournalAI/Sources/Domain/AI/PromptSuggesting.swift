import Foundation

public protocol PromptSuggesting: Sendable {
    func suggestPrompts(
        basedOn entries: [JournalEntry],
        count: Int
    ) async throws(AIProviderError) -> [ReflectivePrompt]
}
