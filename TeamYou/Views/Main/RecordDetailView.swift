import SwiftUI
import SwiftData

struct RecordDetailView: View {
    var record: Record
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert = false
    
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
                ForEach([record.content1, record.content2, record.content3].indices, id: \.self) { index in
                    let content = [record.content1, record.content2, record.content3][index]
                    HStack {
                        Text(content)
                            .foregroundStyle(.alabaster)
                            .font(.system(size: 14))
                            .frame(maxWidth:.infinity, alignment: .topLeading)
                    }
                    .lineSpacing(7)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(height: 140, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                }
            }
            
            VStack {
                Spacer()
                
                VStack {
                    Button(action: {
                        showAlert = true
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
                    .alert("정말 삭제할까요?", isPresented: $showAlert) {
                        Button("삭제", role: .destructive) {
                            modelContext.delete(record)
                            dismiss()
                        }
                        Button("취소", role: .cancel) { }
                    } message: {
                        Text("이 기록은 다시 되돌릴 수 없어요.")
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray1)
    }
}
