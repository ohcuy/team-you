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
            
            CustomProgressBar(progress: viewModel.progress)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center) {
                    Text(formattedDate(viewModel.selectedDate ?? Date()))
                    
                    Spacer()
                    
                    HStack {
                        Text("\(viewModel.selectedSituation?.emoji ?? "")\(viewModel.selectedSituation?.mainText ?? "")")
                        Text("\(viewModel.selectedEmotion?.emoji ?? "")\(viewModel.selectedEmotion?.mainText ?? "")")
                    }
                }
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.alabaster)
                
                VStack(alignment: .leading, spacing: 24) {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.gray3)
                            .frame(maxWidth: .infinity, maxHeight: 120)
                        
                        TextEditor(text: $content1)
                            .foregroundColor(.alabaster)
                            .font(.system(size: 14))
                            .padding(.top, 4)
                            .padding(.leading, 8)
                            .background(.gray3)
                            .frame(height: 120)
                            .scrollContentBackground(.hidden)
                        
                        if content1.isEmpty {
                            Text("오늘 어떤 일이 있었나요?")
                                .font(.system(size: 14))
                                .foregroundColor(.gray4)
                                .padding(12)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.gray3)
                            .frame(maxWidth: .infinity, maxHeight: 120)
                        
                        TextEditor(text: $content2)
                            .foregroundColor(.alabaster)
                            .font(.system(size: 14))
                            .padding(.top, 4)
                            .padding(.leading, 8)
                            .background(.gray3)
                            .frame(height: 120)
                            .scrollContentBackground(.hidden)
                        
                        if content2.isEmpty {
                            Text("이 실패를 통해 무엇을 배웠나요?")
                                .font(.system(size: 14))
                                .foregroundColor(.gray4)
                                .padding(12)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.gray3)
                            .frame(maxWidth: .infinity, maxHeight: 120)
                        
                        TextEditor(text: $content3)
                            .foregroundColor(.alabaster)
                            .font(.system(size: 14))
                            .padding(.top, 4)
                            .padding(.leading, 8)
                            .background(.gray3)
                            .frame(height: 120)
                            .scrollContentBackground(.hidden)
                        
                        if content3.isEmpty {
                            Text("다시 시도한다면 어떻게 해보고 싶나요?")
                                .font(.system(size: 14))
                                .foregroundColor(.gray4)
                                .padding(12)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 8))
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
                    .foregroundColor(content1.isEmpty || content2.isEmpty || content3.isEmpty ? .gray4 : .gray1)
                    .background(content1.isEmpty || content2.isEmpty || content3.isEmpty ? .gray3 : .accent)
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
