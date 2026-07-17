import Foundation

public protocol GenerateWeekSummaryUseCase: Sendable {
    func execute(periodStart: Date, periodEnd: Date) async throws(PeriodAnalysisUseCaseError) -> WeekSummary
}
