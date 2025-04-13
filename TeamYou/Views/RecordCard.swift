import SwiftUI

struct RecordCard: View {
    var category: String
    var emotion: String
    
    var body: some View {
        HStack {
            Text("\(category) \(emotion)")
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding(.vertical, 24)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .background(.gray3)
        .cornerRadius(8)
        .frame(maxWidth: .infinity)
        }
    }

#Preview {
    RecordCard(category: "🤷 뭐라 말 못할 실패", emotion: "🫠 당황스러웠어요")
}
