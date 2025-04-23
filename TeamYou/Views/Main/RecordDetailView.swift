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
                
                Spacer()
                
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
                VStack(alignment: .leading, spacing: 8) {
                    Text("오늘 어떤 일이 있었나요?")
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text(record.content1)
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .lineSpacing(4)
                .frame(height: 140, alignment: .topLeading)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("이 실패를 통해 무엇을 배웠나요?")
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text(record.content2)
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .lineSpacing(4)
                .frame(height: 140, alignment: .topLeading)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("다시 시도한다면 어떻게 해보고 싶나요?")
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text(record.content3)
                        .foregroundStyle(.alabaster)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .lineSpacing(4)
                .frame(alignment: .topLeading)
            }
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(
                    action: {
                        dismiss()
                    })
                {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.alabaster)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        showAlert = true
                    } label: {
                        Label("삭제", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .foregroundStyle(.alabaster)
                }
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
}
