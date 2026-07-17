import Foundation

public protocol DeleteJournalEntryUseCase: Sendable {
    func execute(id: UUID) async throws(RepositoryError)
}
