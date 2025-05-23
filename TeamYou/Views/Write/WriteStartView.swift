import SwiftUI

struct WriteStartView: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    private var mainText = "실패의 순간을\n살짝 떠올려 볼까요?"
    private var subText = "언제, 어떤 일이었는지. 그리고 그때의 마음까지.\n지금 이 기록은, 나를 위한 첫 번째 정리예요."
    
    var body: some View {
        VStack() {
            CustomNavigationBar(
                showRightButton: true,
                rightAction: {
                    viewModel.close()
                })
            
            Spacer()
            
            VStack(spacing: 16) {
                Image(.appIconMedium)
                Group {
                    Text(mainText)
                        .font(.system(size: 20, weight: .bold))
                    Text(subText)
                        .font(.system(size: 16, weight: .light))
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.alabaster)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button (action: {
                viewModel.nextStep()
            }) {
                Text("시작하기")
                    .font(.body)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray1)
                    .background(.accent)
                    .cornerRadius(48)
            }
            .padding(.top, 12)
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
