import SwiftUI
import Combine

class WriteFlowViewModel: ObservableObject {
    @Published var isPresented: Bool = false

    @Published var selectedDate = Date()
    @Published var selectedSituation = ""
    @Published var selectedEmotion = ""
    
    @Published var content1 = ""
    @Published var content2 = ""
    @Published var content3 = ""
    
    func closeFlow() {
        isPresented = false
    }
}
