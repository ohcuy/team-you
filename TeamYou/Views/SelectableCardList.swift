import SwiftUI

struct SelectableCardList: View {
    var body: some View {
        VStack(spacing: 12) {
            ForEach(0..<4) { _ in
                SelectableCard()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.gray1)
    }
}
