import SwiftUI

struct WriteStep4View: View {
    @Environment(\.dismiss) private var dismiss
    @State var progress = 0.0
    
    @State var content1 = ""
    @State var content2 = ""
    @State var content3 = ""
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showLeftButton: true,
                showRightButton: true,
                rightAction: { dismiss() })
            
            CustomProgressView()
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Text("4월 15일")
                    
                    Spacer()
                    
                    HStack {
                        Text("📚 해보려 했는데")
                        Text("😤 속상했어요")
                    }
                }
                .foregroundStyle(.alabaster)
                
                VStack(alignment: .leading, spacing: 24) {
                    TextField(
                        "",
                        text: $content1,
                        prompt: Text("오늘 어떤 일이 있었나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                    
                    TextField(
                        "",
                        text: $content2,
                        prompt: Text("이 실패를 통해 무엇을 배웠나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                    
                    TextField(
                        "",
                        text: $content3,
                        prompt: Text("다시 시도한다면 어떻게 해보고 싶나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                }
            }
            
            Spacer()
            
            NavigationLink(destination: WriteFinishView()) {
                Text("다음")
                    .font(.body)
                    .bold()
                    .padding()
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

#Preview {
    WriteStep4View()
}
