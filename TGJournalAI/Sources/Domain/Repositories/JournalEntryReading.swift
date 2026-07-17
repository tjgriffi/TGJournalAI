import Foundation

public protocol JournalEntryReading: Sendable {
    func fetchEntry(id: UUID) async throws(RepositoryError) -> JournalEntry?
    func fetchEntries(from startDate: Date, to endDate: Date) async throws(RepositoryError) -> [JournalEntry]
    func fetchAllEntries() async throws(RepositoryError) -> [JournalEntry]
}
