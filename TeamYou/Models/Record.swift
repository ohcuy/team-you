import Foundation
import SwiftData

@Model
class Record: Identifiable {
    var id: UUID
    var month: Int
    var day: Int
    var category: String
    var emotion: String
    var content1: String
    var content2: String
    var content3: String
    
    init(id: UUID = UUID(), month: Int, day: Int, category: String, emotion: String, content1: String, content2: String, content3: String) {
        self.id = id
        self.month = month
        self.day = day
        self.category = category
        self.emotion = emotion
        self.content1 = content1
        self.content2 = content2
        self.content3 = content3
    }
}
