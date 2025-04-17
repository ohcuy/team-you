import Foundation

enum SelectableItemType {
    case situation
    case emotion
}

struct SelectableItem: Identifiable, Equatable {
    let id = UUID()
    let emoji: String
    let mainText: String
    let secondaryText: String
    let type: SelectableItemType
}
