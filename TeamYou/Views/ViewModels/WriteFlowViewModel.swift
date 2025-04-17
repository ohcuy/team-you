import SwiftUI
import Combine

class WriteFlowViewModel: ObservableObject {
    @Published var isPresented = false
    @Published var path: [WriteStep] = []
    
    func start() {
        path = [.start]
    }
    
    func close() {
        isPresented = false
    }
    
    func nextStep() {
        guard let current = path.last else { return }
        let next: WriteStep? = switch current {
        case .start: .step1
        case .step1: .step2
        case .step2: .step3
        case .step3: .step4
        case .step4: .finish
        case .finish: .share
        case .share: nil
        }
        if let nextStep = next {
            path.append(nextStep)
        }
    }
    
    func previousStep() {
        if path.count > 1 {
            path.removeLast()
        }
    }
}

