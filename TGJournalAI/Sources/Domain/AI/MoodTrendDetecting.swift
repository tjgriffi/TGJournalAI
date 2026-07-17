import Foundation

public protocol MoodTrendDetecting: Sendable {
    func detectTrend(
        entries: [JournalEntry],
        periodStart: Date,
        periodEnd: Date
    ) async throws(AIProviderError) -> MoodTrend
}
