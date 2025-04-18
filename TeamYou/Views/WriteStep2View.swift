import SwiftUI

struct WriteStep2View: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel

    var body: some View {
        VStack {
            CustomNavigationBar(
                showLeftButton: true,
                showRightButton: true,
                leftAction: {
                    viewModel.previousStep()
                },
                rightAction: {
                    viewModel.close()
                })
            
            CustomProgressBar(progress: viewModel.progress)
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("어떤 상황에서 있었던 일이었나요?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.alabaster)
                    Text("업무, 일상, 관계… 실패를 겪은 분야를 골라주세요.")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.alabaster)
                }
                SelectableCardList(type: .situation)
            }
            
            Spacer()
            
            Button (action: {
                viewModel.nextStep()
            }) {
                Text("다음")
                    .font(.body)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(viewModel.selectedSituation == nil ? Color.gray4 : Color.gray1)
                    .background(viewModel.selectedSituation == nil ? Color.gray3 : Color.accent)
                    .cornerRadius(48)
            }
            .disabled(viewModel.selectedSituation == nil)
            .padding(.top, 12)
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
