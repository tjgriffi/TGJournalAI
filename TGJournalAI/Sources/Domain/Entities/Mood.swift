import Foundation

public enum Mood: Int, CaseIterable, Codable, Equatable, Hashable, Sendable {
    case veryLow = 1
    case low = 2
    case neutral = 3
    case good = 4
    case great = 5
}

extension Mood: Comparable {
    public static func < (lhs: Mood, rhs: Mood) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
