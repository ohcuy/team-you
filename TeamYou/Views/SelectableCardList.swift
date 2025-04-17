import SwiftUI

struct SelectableCardList: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    let type: SelectableItemType
    
    var filteredItems: [SelectableItem] {
        switch type {
        case .situation:
            return viewModel.situationList
        case .emotion:
            return viewModel.emotionList
        }
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(filteredItems) { item in
                SelectableCard(item: item)
            }        }
        .frame(maxWidth: .infinity)
        .background(.gray1)
    }
}
