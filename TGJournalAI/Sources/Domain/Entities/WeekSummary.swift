import Foundation

public struct WeekSummary: Identifiable, Equatable, Sendable {
    public let id: UUID
    public let periodStart: Date
    public let periodEnd: Date
    public let summaryText: String
    public let highlightedThemes: [String]
    public let dominantMood: Mood?
    public let generatedAt: Date

    public init(
        id: UUID = UUID(),
        periodStart: Date,
        periodEnd: Date,
        summaryText: String,
        highlightedThemes: [String] = [],
        dominantMood: Mood? = nil,
        generatedAt: Date = Date()
    ) throws(ValidationError) {
        guard periodEnd > periodStart else {
            throw .invalidDateRange
        }
        self.id = id
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.summaryText = summaryText
        self.highlightedThemes = highlightedThemes
        self.dominantMood = dominantMood
        self.generatedAt = generatedAt
    }
}
