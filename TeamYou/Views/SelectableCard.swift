import SwiftUI

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
                    .foregroundStyle(isSelected ? Color.gray1 : Color.alabaster)
                    .fontWeight(.semibold)
                Text(item.secondaryText)
                    .font(.footnote)
                    .foregroundStyle(isSelected ? Color.gray1 : Color.alabaster)
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
