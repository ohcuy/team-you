import SwiftUI
import Combine

class WriteFlowViewModel: ObservableObject {
    @Published var isPresented: Bool = false

    func closeFlow() {
        isPresented = false
    }
}
