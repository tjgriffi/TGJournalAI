import Foundation

public struct ReflectivePrompt: Identifiable, Equatable, Sendable {
    public let id: UUID
    public let text: String
    public let relatedThemes: [String]
    public let generatedAt: Date

    public init(
        id: UUID = UUID(),
        text: String,
        relatedThemes: [String] = [],
        generatedAt: Date = Date()
    ) {
        self.id = id
        self.text = text
        self.relatedThemes = relatedThemes
        self.generatedAt = generatedAt
    }
}
