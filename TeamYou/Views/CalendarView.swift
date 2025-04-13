import SwiftUI

struct CalendarView: View {
    @State private var date = Date()

    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .padding(8)
            .datePickerStyle(.graphical)
            .frame(maxWidth: .infinity, maxHeight: 334)
            .background(Color(red: 0.14, green: 0.14, blue: 0.14))
            .cornerRadius(8)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    CalendarView()
}
