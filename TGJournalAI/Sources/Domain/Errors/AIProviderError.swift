import Foundation

public enum AIProviderError: Error, Equatable, Sendable {
    case unavailable
    case contentExceedsBudget
    case requestFailed(String)
    case invalidResponse(String)
    case cancelled
    case unknown(String)
}
