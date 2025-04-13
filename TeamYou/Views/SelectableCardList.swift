import SwiftUI

struct SelectableCardList: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { _ in
                SelectableCardView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 20)
        .background(.gray1)
    }
}

#Preview {
    SelectableCardList()
}
