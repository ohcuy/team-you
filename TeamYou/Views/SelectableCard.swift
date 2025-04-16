import SwiftUI

struct SelectableCard: View {
    @State var emoji = "🤷"
    @State var mainText = "뭐라 말 못할 실패"
    @State var secondaryText = "이유는 모르겠지만... 그냥 실패한 날"
    
    var body: some View {
        HStack(alignment:.center) {
            Text(emoji)
                .font(.system(size: 24))
            VStack(alignment: .leading) {
                Text(mainText)
                    .font(.callout)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text(secondaryText)
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
