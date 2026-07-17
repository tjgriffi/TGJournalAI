import Foundation

public protocol DetectMoodTrendUseCase: Sendable {
    func execute(periodStart: Date, periodEnd: Date) async throws(PeriodAnalysisUseCaseError) -> MoodTrend
}
