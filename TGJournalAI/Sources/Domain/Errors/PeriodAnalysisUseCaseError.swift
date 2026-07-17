import Foundation

public enum PeriodAnalysisUseCaseError: Error, Equatable, Sendable {
    case validation(ValidationError)
    case repository(RepositoryError)
    case aiProvider(AIProviderError)
}
