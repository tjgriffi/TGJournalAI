import Foundation

public protocol SuggestReflectivePromptsUseCase: Sendable {
    func execute(count: Int) async throws(JournalAIUseCaseError) -> [ReflectivePrompt]
}
