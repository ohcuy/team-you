import SwiftUI

struct WriteStep4View: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @Environment(\.modelContext) var modelContext
    
    @State var content1 = ""
    @State var content2 = ""
    @State var content3 = ""
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showLeftButton: true,
                showRightButton: true,
                leftAction: {
                    viewModel.previousStep()
                },
                rightAction: {
                    viewModel.close()
                })
            
            CustomProgressBar()
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Text(formattedDate(viewModel.selectedDate ?? Date()))
                    
                    Spacer()
                    
                    HStack {
                        Text("\(viewModel.selectedSituation?.emoji ?? "")\(viewModel.selectedSituation?.mainText ?? "")")
                        Text("\(viewModel.selectedEmotion?.emoji ?? "")\(viewModel.selectedEmotion?.mainText ?? "")")
                    }
                }
                .foregroundStyle(.alabaster)
                
                VStack(alignment: .leading, spacing: 24) {
                    TextField(
                        "",
                        text: $content1,
                        prompt: Text("오늘 어떤 일이 있었나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                    
                    TextField(
                        "",
                        text: $content2,
                        prompt: Text("이 실패를 통해 무엇을 배웠나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                    
                    TextField(
                        "",
                        text: $content3,
                        prompt: Text("다시 시도한다면 어떻게 해보고 싶나요?")
                            .foregroundColor(.gray4)
                    )
                    .font(.system(size: 14))
                    .foregroundStyle(.alabaster)
                    .lineSpacing(14)
                    .padding(.top, 12)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
                    .background(.gray3)
                    .cornerRadius(8)
                }
            }
            
            Spacer()
            
            Button (action: {
                saveRecord()
                viewModel.nextStep()
            }) {
                Text("다음")
                    .font(.body)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(content1.isEmpty || content2.isEmpty || content3.isEmpty ? Color.gray4 : Color.gray1)
                    .background(content1.isEmpty || content2.isEmpty || content3.isEmpty ? Color.gray3 : Color.accent)
                    .cornerRadius(48)
            }
            .disabled(content1.isEmpty || content2.isEmpty || content3.isEmpty)
            .padding(.top, 12)
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
    
    
    private func saveRecord() {
        guard let date = viewModel.selectedDate,
              let situation = viewModel.selectedSituation,
              let emotion = viewModel.selectedEmotion else {
            return
        }
        
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let record = Record(
            month: month,
            day: day,
            situation: situation.emoji + situation.mainText,
            emotion: emotion.emoji + emotion.mainText,
            content1: content1,
            content2: content2,
            content3: content3
        )
        
        viewModel.content1 = content1
        viewModel.content2 = content2
        viewModel.content3 = content3
        
        modelContext.insert(record)
    }
}

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "M월 d일"
    return formatter.string(from: date)
}
