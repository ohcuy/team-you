import SwiftUI

struct WriteStep3View: View {
    @Environment(\.dismiss) private var dismiss
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showLeftButton: true,
                showRightButton: true,
                rightAction: { dismiss() })
            
            CustomProgressView()
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("그 순간, 어떤 감정이 가장 컸나요?")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.alabaster)
                    Text("나의 감정을 솔직하게 돌아볼 수 있는 시간이 될 거예요.")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundStyle(.alabaster)
                }
                SelectableCardList()
            }
            
            Spacer()
            
            NavigationLink(destination: WriteStep4View()) {
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
