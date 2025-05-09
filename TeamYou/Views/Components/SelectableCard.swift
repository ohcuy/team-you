import Foundation
import SwiftUI

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

struct SelectableCard: View {
    let item: SelectableItem
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack(alignment:.center) {
            Text(item.emoji)
                .font(.system(size: 24))
            VStack(alignment: .leading) {
                Text(item.mainText)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(isSelected ? .gray1 : .alabaster)
                Text(item.secondaryText)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(isSelected ? .gray1 : .alabaster)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isSelected ? Color.accentColor : Color.gray3)
        .cornerRadius(8)
        .onTapGesture {
            onTap()
        }
    }
}
