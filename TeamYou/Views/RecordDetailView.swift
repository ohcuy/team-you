import SwiftUI
import SwiftData

struct RecordDetailView: View {
    var record: Record

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("\(record.month)월 \(record.day)일")
                    .foregroundColor(.alabaster)
                    .font(.system(size: 16, weight: .medium))
                Text(record.category)
                    .foregroundColor(.alabaster)
                    .font(.system(size: 15, weight: .medium))
                Text(record.emotion)
                    .foregroundColor(.alabaster)
                    .font(.system(size: 15, weight: .medium))
            }
            VStack(alignment: .leading) {
                ForEach([record.content1, record.content2, record.content3], id: \.self) { content in
                    HStack {
                        Text(content)
                            .foregroundStyle(.alabaster)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(12)
                    .background(.gray3)
                    .cornerRadius(8)
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
    }
}

#Preview {
    NavigationStack {
        RecordDetailView(record: Record.sampleData[0])
    }
}
