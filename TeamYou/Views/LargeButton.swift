import SwiftUI

struct LargeButton: View {
    @State var buttonText = ""
    @State var isCompleted = false
    
    var body: some View {
        ZStack {
            NavigationLink(destination: WriteView()) {
                Text("기록하기")
                    .font(.body)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray1)
                    .background(.accent)
                    .cornerRadius(48)
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(.gray1)
        }
    }
}

#Preview {
    LargeButton()
}
