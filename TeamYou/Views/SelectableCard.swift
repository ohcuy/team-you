import SwiftUI

struct SelectableCard: View {
    let item: SelectableItem
    
    var body: some View {
        HStack(alignment:.center) {
            Text(item.emoji)
                .font(.system(size: 24))
            VStack(alignment: .leading) {
                Text(item.mainText)
                    .font(.callout)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text(item.secondaryText)
                    .font(.footnote)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray3)
        .cornerRadius(8)
    }
}
