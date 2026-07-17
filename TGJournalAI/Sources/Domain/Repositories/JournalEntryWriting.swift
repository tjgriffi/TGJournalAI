import Foundation

public protocol JournalEntryWriting: Sendable {
    func save(_ entry: JournalEntry) async throws(RepositoryError)
    func delete(id: UUID) async throws(RepositoryError)
}
