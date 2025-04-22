import ConfettiSwiftUI
import SwiftUI
import UIKit

struct ShareImageView: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @State private var shareStatus: String? = nil
    @State private var trigger: Int = 0

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CustomNavigationBar(
                        showRightButton: true,
                        rightAction: {
                            viewModel.close()
                        })
                    
                    VStack(spacing: 36) {
                        VStack(spacing: 4) {
                            Text("오실완! 오늘도 잘 돌아봤어요.")
                                .font(.system(size: 20, weight: .bold))
                            Text("원한다면, 이 기록을 이미지로 저장할 수 있어요.")
                                .font(.system(size: 13))
                        }
                        
                        let viewSize = CGSize(width: 270, height: 480)
                        ShareImage(size: viewSize, scale: 1.0)
                            .cornerRadius(4)
                            .shadow(color: .white.opacity(0.2), radius: 16, x: 0, y: 4)
                            .confettiCannon(trigger: $trigger, num: 100, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 300)
                            .onAppear {
                                trigger += 1
                            }

                        if let status = shareStatus {
                            Text(status)
                                .font(.caption)
                                .foregroundColor(.gray4)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            
            VStack {
                Button(action: {
                    let exportScale: CGFloat = 4.0
                    let exportSize = CGSize(width: 270 * exportScale, height: 480 * exportScale)
                    
                    let image = ShareImage(size: exportSize, scale: exportScale)
                        .environmentObject(viewModel)
                        .snapshot(size: exportSize)

                    UIPasteboard.general.image = image
                    
                    shareStatus = "이미지가 클립보드에 복사되었어요!"
                }) {
                    Text("이미지 복사하기")
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
