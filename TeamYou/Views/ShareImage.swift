import SwiftUI

struct ShareImage: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    var size: CGSize
    var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack {
                    Text(formattedDate(viewModel.selectedDate ?? Date()))
                        .font(.system(size: 19 * scale, weight: .bold))
                        .foregroundStyle(.accent)
                    
                    Image("StoryImageAsset")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240 * scale, height: 120 * scale)
                }
                .padding(.vertical, 12 * (scale * 0.75))
                
                HStack {
                    VStack(alignment: .leading, spacing: 16 * scale) {
                        VStack(alignment: .leading, spacing: 6 * scale) {
                            Text("오늘 어떤 일이 있었냐면..")
                                .font(.system(size: 12 * scale, weight: .bold))
                            
                            HStack(spacing: 8 * scale) {
                                Text("\(viewModel.selectedSituation?.emoji ?? "")\(viewModel.selectedSituation?.mainText ?? "")")
                                    .font(.system(size: 11 * (scale * 0.75), weight: .semibold))
                                    .foregroundStyle(.gray1)
                                    .padding(4 * scale)
                                    .background(.alabaster)
                                
                                Text("\(viewModel.selectedEmotion?.emoji ?? "")\(viewModel.selectedEmotion?.mainText ?? "")")
                                    .font(.system(size: 11 * (scale * 0.75), weight: .semibold))
                                    .foregroundStyle(.gray1)
                                    .padding(4 * scale)
                                    .background(.alabaster)
                            }
                            
                            Text(viewModel.content1)
                                .font(.system(size: 11 * (scale * 0.75), weight: .semibold))
                                .foregroundStyle(.gray1)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(4 * scale)
                                .background(.alabaster)
                        }
                        
                        VStack(alignment:.leading, spacing: 6 * scale) {
                            Text("그 실패에서 무엇을 배웠냐면..")
                                .font(.system(size: 12 * scale, weight: .bold))
                            
                            Text(viewModel.content2)
                                .font(.system(size: 11 * (scale * 0.75), weight: .semibold))
                                .foregroundStyle(.gray1)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(4 * scale)
                                .background(.alabaster)
                        }
                        
                        VStack(alignment:.leading, spacing: 6 * scale) {
                            Text("다시 시도한다면 다음에는..")
                                .font(.system(size: 12 * scale, weight: .bold))
                            
                            Text(viewModel.content3)
                                .font(.system(size: 11 * (scale * 0.75), weight: .semibold))
                                .foregroundStyle(.gray1)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(4 * scale)
                                .background(.alabaster)
                        }
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack(spacing: 8 * scale) {
                    Image("AppIconWhite")
                        .resizable()
                        .frame(width: 12 * (scale * 0.75), height: 12 * (scale * 0.75))
                    
                    Text("당신의 실패를 응원하는, 실패 응원단")
                        .font(.system(size: 11 * (scale * 0.75), weight: .regular))
                }
            }
            .padding(.vertical, 14 * (scale * 0.75))
            .padding(.horizontal, 12 * (scale * 0.75))
            .frame(width: size.width, height: size.height, alignment: .top)
            .background(.gray1)
        }
    }
}
