import SwiftUI

struct WriteStep4View: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @Environment(\.modelContext) var modelContext
    
    @FocusState private var isTextEditorFocused: Bool
    
    @State private var content1 = ""
    @State private var content2 = ""
    @State private var content3 = ""
    
    @State private var prevCount1 = 0
    @State private var prevCount2 = 0
    @State private var prevCount3 = 0
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showLeftButton: true,
                showRightButton: true,
                leftAction: { viewModel.previousStep() },
                rightAction: { viewModel.close() }
            )
            
            CustomProgressBar(progress: viewModel.progress)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(formattedDate(viewModel.selectedDate ?? Date()))
                    
                    Spacer()
                    
                    HStack {
                        Text("\(viewModel.selectedSituation?.emoji ?? "")\(viewModel.selectedSituation?.mainText ?? "")")
                        Text("\(viewModel.selectedEmotion?.emoji ?? "")\(viewModel.selectedEmotion?.mainText ?? "")")
                    }
                }
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.alabaster)
                
                VStack(spacing: 24) {
                    ForEach(0..<3, id: \.self) { index in
                        customTextEditor(
                            title: index == 0 ? "오늘 어떤 일이 있었나요?" :
                                index == 1 ? "이 실패를 통해 무엇을 배웠나요?" :
                                "다시 시도한다면 어떻게 해보고 싶나요?",
                            text: index == 0 ? $content1 :
                                index == 1 ? $content2 : $content3,
                            prevCount: index == 0 ? $prevCount1 :
                                index == 1 ? $prevCount2 : $prevCount3
                        )
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                saveRecord()
                viewModel.nextStep()
            }) {
                Text("다음")
                    .font(.body).bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(content1.isEmpty || content2.isEmpty || content3.isEmpty ? .gray4 : .gray1)
                    .background(content1.isEmpty || content2.isEmpty || content3.isEmpty ? .gray3 : .accent)
                    .cornerRadius(48)
            }
            .disabled(content1.isEmpty || content2.isEmpty || content3.isEmpty)
            .padding(.top, 12)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func customTextEditor(title: String, text: Binding<String>, prevCount: Binding<Int>) -> some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.gray3)
            
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    if text.wrappedValue.isEmpty {
                        Text(title)
                            .foregroundColor(.gray4)
                            .font(.system(size: 14))
                            .padding(12)
                    }
                    
                    TextEditor(text: text)
                        .foregroundColor(.alabaster)
                        .font(.system(size: 14))
                        .padding(.top, 2)
                        .padding(.horizontal, 8)
                        .scrollContentBackground(.hidden)
                        .background(.clear)
                        .frame(height: 120)
                        .focused($isTextEditorFocused)
                        .onTapGesture {
                            isTextEditorFocused = true
                        }
                        .onChange(of: text.wrappedValue) { oldValue, newValue in
                            if newValue.count > 140 {
                                text.wrappedValue = String(newValue.prefix(140))
                            }
                            if prevCount.wrappedValue < 140 && newValue.count == 140 {
                                let generator = UIImpactFeedbackGenerator(style: .medium)
                                generator.impactOccurred()
                            }
                            prevCount.wrappedValue = newValue.count
                        }
                }
                
                HStack(spacing: 0) {
                    Spacer()
                    Text("\(text.wrappedValue.count)")
                        .foregroundColor(.alabaster)
                    Text("/140")
                        .foregroundColor(.gray4)
                        .padding(.trailing, 12)
                }
                .font(.system(size: 13))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .clipShape(RoundedRectangle(cornerRadius: 8))
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
