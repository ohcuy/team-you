import SwiftUI

enum WriteStep: Hashable {
    case start, step1, step2, step3, step4, finish, share
}

struct WriteView: View {
    @EnvironmentObject var viewModel: WriteFlowViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            WriteStartView()
                .navigationDestination(for: WriteStep.self) { step in
                    switch step {
                    case .start: WriteStartView()
                    case .step1: WriteStep1View()
                    case .step2: WriteStep2View()
                    case .step3: WriteStep3View()
                    case .step4: WriteStep4View()
                    case .finish: WriteFinishView()
                    case .share: ShareImageView()
                    }
                }
        }
        .onAppear {
            viewModel.start()
        }
    }
}
