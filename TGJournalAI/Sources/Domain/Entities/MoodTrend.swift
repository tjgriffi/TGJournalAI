import Foundation

public enum TrendDirection: Equatable, Sendable {
    case improving
    case declining
    case stable
    case insufficientData
}

public struct MoodTrend: Identifiable, Equatable, Sendable {
    public let id: UUID
    public let periodStart: Date
    public let periodEnd: Date
    public let direction: TrendDirection
    public let averageMood: Double?
    public let insight: String
    public let generatedAt: Date

    public init(
        id: UUID = UUID(),
        periodStart: Date,
        periodEnd: Date,
        direction: TrendDirection,
        averageMood: Double? = nil,
        insight: String,
        generatedAt: Date = Date()
    ) throws(ValidationError) {
        guard periodEnd > periodStart else {
            throw .invalidDateRange
        }
        self.id = id
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.direction = direction
        self.averageMood = averageMood
        self.insight = insight
        self.generatedAt = generatedAt
    }
}
