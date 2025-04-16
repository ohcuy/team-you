import SwiftUI
import SwiftData

struct RecordDetailView: View {
    var record: Record
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(record.month)월 \(record.day)일")
                    .foregroundColor(.alabaster)
                    .font(.system(size: 16, weight: .medium))
                Text(record.situation)
                    .foregroundColor(.alabaster)
                    .font(.system(size: 15, weight: .medium))
                Text(record.emotion)
                    .foregroundColor(.alabaster)
                    .font(.system(size: 15, weight: .medium))
            }
            .padding(.top, 12)
            .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 24) {
                ForEach([record.content1, record.content2, record.content3], id: \.self) { content in
                    HStack {
                        Text(content)
                            .foregroundStyle(.alabaster)
                            .font(.system(size: 14))
                            .frame(maxWidth:.infinity, alignment: .topLeading)
                    }
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120)
                    .background(.gray3)
                    .cornerRadius(8)
                }
            }
            
            VStack {
                Spacer()
                
                VStack {
                    Button(action: {
                    }) {
                        Text("삭제")
                            .font(.body)
                            .bold()
                            .padding(.vertical, 16)
                            .padding(.horizontal, 48)
                            .foregroundColor(.alabaster)
                            .background(.gray3)
                            .cornerRadius(48)
                    }
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity)
                    .background(.gray1)
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray1)
    }
}
