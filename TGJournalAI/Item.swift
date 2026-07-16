//
//  Item.swift
//  TGJournalAI
//
//  Created by Terrance Griffith on 7/15/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
