import Foundation

public protocol UpdateJournalEntryUseCase: Sendable {
    func execute(_ entry: JournalEntry) async throws(RepositoryError) -> JournalEntry
}
