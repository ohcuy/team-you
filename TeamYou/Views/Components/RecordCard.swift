import SwiftUI

struct RecordCard: View {
    @State var category: String
    @State var emotion: String
    
    var body: some View {
        HStack {
            Text("\(category) \(emotion)")
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding(.vertical, 24)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(.body, weight: .light))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .background(.gray3)
        .cornerRadius(8)
        .frame(maxWidth: .infinity)
    }
}
