import Foundation

public struct JournalEntry: Identifiable, Equatable, Hashable, Sendable {
    public let id: UUID
    public var date: Date
    public var text: String
    public var mood: Mood?
    public var tags: [String]
    public let createdAt: Date
    public var updatedAt: Date

    public init(
        id: UUID = UUID(),
        date: Date,
        text: String,
        mood: Mood? = nil,
        tags: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.date = date
        self.text = text
        self.mood = mood
        self.tags = tags
        self.createdAt = createdAt
        self.updatedAt = updatedAt ?? createdAt
    }
}
