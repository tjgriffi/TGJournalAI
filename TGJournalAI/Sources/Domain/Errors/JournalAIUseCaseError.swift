import Foundation

public enum JournalAIUseCaseError: Error, Equatable, Sendable {
    case repository(RepositoryError)
    case aiProvider(AIProviderError)
}
