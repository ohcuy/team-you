import SwiftUI

struct SplashView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Image(.appIconMedium)
            VStack(spacing: 16) {
                VStack() {
                    Text("실패해도 괜찮아.")
                        .font(
                            .system(size: 36)
                            .weight(.medium)
                        )
                        .foregroundColor(.alabaster)
                    Text("실패 응원단!")
                        .font(
                            .system(size: 36)
                            .weight(.bold)
                        )
                        .foregroundColor(.accent)
                }
                Text("가볍게, 당당하게, 실패를 기록하는 시간")
                    .font(
                        .system(size: 16)
                        .weight(.light)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.alabaster)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
        .background(.gray1)
    }
}

#Preview {
    SplashView()
}
