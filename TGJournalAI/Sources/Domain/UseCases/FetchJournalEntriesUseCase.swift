import Foundation

public protocol FetchJournalEntriesUseCase: Sendable {
    func execute(from startDate: Date, to endDate: Date) async throws(RepositoryError) -> [JournalEntry]
}
