import SwiftUI

struct ShareImage: View {
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 16) {
                VStack {
                    Text("25년 4월 16일")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.accent)

                    Image("StoryImageAsset")
                }
                .padding(.vertical, 12)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("오늘 어떤 일이 있었냐면..")
                            .font(.system(size: 16, weight: .bold))
                        
                        HStack(spacing: 8) {
                            Text("📚 해보려 했는데")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.gray1)
                                .frame(alignment: .topLeading)
                                .padding(4)
                                .background(.alabaster)
                            Text("😤 속상했어요")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.gray1)
                                .frame(alignment: .topLeading)
                                .padding(4)
                                .background(.alabaster)
                        }
                        
                        Text("발표자료를 거의 다 만들었는데 저장을 못 해서 날렸다. 멘붕 왔지만 다시 만들고 겨우 끝냈다.")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray1)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(4)
                            .background(.alabaster)
                    }
                    
                    VStack(alignment:.leading, spacing: 6) {
                        Text("그 실패에서 무엇을 배웠냐면..")
                            .font(.system(size: 16, weight: .bold))
                        Text("발표자료를 거의 다 만들었는데 저장을 못 해서 날렸다. 멘붕 왔지만 다시 만들고 겨우 끝냈다.")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray1)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(4)
                            .background(.alabaster)
                    }
                    
                    VStack(alignment:.leading, spacing: 6) {
                        Text("다시 시도한다면 다음에는..")
                            .font(.system(size: 16, weight: .bold))
                        Text("발표자료를 거의 다 만들었는데 저장을 못 해서 날렸다. 멘붕 왔지만 다시 만들고 겨우 끝냈다.")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray1)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding(4)
                            .background(.alabaster)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image("AppIconSmallWhite")
                    Text("당신의 실패를 응원하는, 실패 응원단")
                        .font(.system(size: 12, weight: .regular))
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .frame(width: 335, height: 596, alignment: .top)
            .background(.gray1)
        }
    }
}
