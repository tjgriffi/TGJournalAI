import Foundation

public protocol CreateJournalEntryUseCase: Sendable {
    func execute(
        date: Date,
        text: String,
        mood: Mood?,
        tags: [String]
    ) async throws(RepositoryError) -> JournalEntry
}
