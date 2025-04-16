import SwiftUI
import SwiftData

struct WriteFinishView: View {
    private var mainText = "무거웠던 마음\n이제 조금 가벼워졌나요?"
    private var subText = "오늘도 잘 털어냈어요. 내일의 나에게, 파이팅!"
    
    var body: some View {
        VStack {
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
            
            Spacer()
            
            NavigationLink(destination: ShareImageView()) {
                Text("기록완료")
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
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
