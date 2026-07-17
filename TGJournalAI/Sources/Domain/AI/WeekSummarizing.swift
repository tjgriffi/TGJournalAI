import Foundation

public protocol WeekSummarizing: Sendable {
    func summarize(
        entries: [JournalEntry],
        periodStart: Date,
        periodEnd: Date
    ) async throws(AIProviderError) -> WeekSummary
}
