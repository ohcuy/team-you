import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(height: geometry.size.height * 0.2)
                
                VStack(spacing: 16) {
                    LottieView(filename: "SplashIcon")
                        .frame(width: 200, height: 200)
                    
                    VStack{
                        Text("실패해도 괜찮아.")
                            .font(.system(size: 36, weight: .medium))
                            .foregroundColor(.alabaster)
                        
                        Text("실패 응원단!")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.accent)
                    }
                    
                    Text("가볍게, 당당하게, 실패를 기록하는 시간")
                        .font(.system(size: 16, weight: .light))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.alabaster)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.gray1)
        }
    }
}
