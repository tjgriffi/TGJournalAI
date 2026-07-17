import Foundation

public protocol FetchJournalEntryUseCase: Sendable {
    func execute(id: UUID) async throws(RepositoryError) -> JournalEntry?
}
