import SwiftUI

struct ShareImageView: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @State private var isShareSheetOpen = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CustomNavigationBar(
                        showRightButton: true,
                        rightAction: {
                            viewModel.closeFlow()
                        })
                    
                    VStack(spacing: 36) {
                        VStack(spacing: 4) {
                            Text("오실완! 오늘도 잘 돌아봤어요.")
                                .font(.system(size: 20, weight: .bold))
                            Text("원한다면, 이 기록을 인스타그램 스토리로 남겨볼 수도 있어요.")
                                .font(.system(size: 13))
                        }
                        
                        ShareImage()
                            .cornerRadius(4)
                            .shadow(color: .white.opacity(0.2), radius: 16, x: 0, y: 4)
                    }
                }
                .padding(.horizontal, 20)
            }
            
            VStack {
                Button(action: {
                }) {
                    Text("공유하기")
                        .font(.body)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.gray1)
                        .background(.accent)
                        .cornerRadius(48)
                        .padding(.horizontal, 16)
                }
                .padding(.top, 12)
                .frame(maxWidth: .infinity)
                .background(.gray1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
