import SwiftUI

struct WriteStep1View: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    @State var date = Date()
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showRightButton: true,
                rightAction: {
                    viewModel.closeFlow()
                })
            
            CustomProgressBar()
            
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
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .padding(8)
                .datePickerStyle(.graphical)
                .frame(maxWidth: .infinity)
                .background(.gray2)
                .cornerRadius(8)
            }
            
            Spacer()
            
            NavigationLink(destination: WriteStep2View()) {
                Text("다음")
                    .font(.body)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.gray1)
                    .background(.accent)
                    .cornerRadius(48)
            }
            .padding(.top, 12)
            .background(.gray1)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1)
        .navigationBarBackButtonHidden(true)
    }
}
