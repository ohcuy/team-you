import SwiftUI

struct WriteStep1View: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @State var hasSelectedDate = false
    @State var date = Date()
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showRightButton: true,
                rightAction: {
                    viewModel.close()
                })
            
            CustomProgressBar(progress: viewModel.progress)
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("이 실패, 언제의 이야기인가요?")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.alabaster)
                        Text("기억하고 싶은 날을 선택해 주세요.")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.alabaster)
                    }
                }
                
                DatePicker(
                    "",
                    selection: Binding(
                        get: {
                            viewModel.selectedDate ?? Date()
                        },
                        set: { newDate in
                            viewModel.selectedDate = newDate
                            hasSelectedDate = true
                        }
                    ),
                    displayedComponents: [.date]
                )
                .padding(8)
                .datePickerStyle(.graphical)
                .frame(maxWidth: .infinity)
                .background(.gray2)
                .cornerRadius(8)
            }
            
            Spacer()
            
            Button (action: {
                viewModel.nextStep()
            }) {
                Text("다음")
                    .font(.body)
                    .bold()
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(!hasSelectedDate ? .gray4 : .gray1)
                    .background(!hasSelectedDate ? .gray3 : .accent)
                    .cornerRadius(48)
            }
            .disabled(!hasSelectedDate)
            .padding(.top, 12)
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
