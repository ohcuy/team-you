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
                SelectableCard(
                    item: item,
                    isSelected: {
                        switch type {
                        case .situation:
                            return viewModel.selectedSituation?.id == item.id
                        case .emotion:
                            return viewModel.selectedEmotion?.id == item.id
                        }
                    }(),
                    onTap: {
                        switch type {
                        case .situation:
                            viewModel.selectedSituation = item
                        case .emotion:
                            viewModel.selectedEmotion = item
                        }
                    }
                )
            }
            .frame(maxWidth: .infinity)
            .background(.gray1)
        }
    }
}
