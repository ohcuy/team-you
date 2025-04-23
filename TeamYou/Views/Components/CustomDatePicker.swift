import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedYear: Int
    @Binding var selectedMonth: Int
    @Binding var isPresented: Bool
    
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button("완료") {
                    selectedYear = Calendar.current.component(.year, from: selectedDate)
                    selectedMonth = Calendar.current.component(.month, from: selectedDate)
                    isPresented = false
                }
                .font(.headline)
                .padding()
            }
            
            Divider()
            
            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .labelsHidden()
                .frame(maxHeight: 250)
            
            Spacer()
        }
        .onAppear {
            selectedDate = Calendar.current.date(from: DateComponents(year: selectedYear, month: selectedMonth)) ?? Date()
        }
        .presentationDetents([.height(300)])
    }
}
