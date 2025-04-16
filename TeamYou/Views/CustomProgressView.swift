import SwiftUI

struct CustomProgressView: View {
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
        }
        .progressViewStyle(OrangeProgressViewStyle())
    }
}

struct OrangeProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .cornerRadius(100)
            .padding(.vertical, 16)
    }
}
