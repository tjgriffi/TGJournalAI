import Foundation

public enum RepositoryError: Error, Equatable, Sendable {
    case notFound
    case saveFailed(String)
    case deleteFailed(String)
    case loadFailed(String)
    case cancelled
    case unknown(String)
}
