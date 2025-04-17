import SwiftUI
import Combine

class WriteFlowViewModel: ObservableObject {
    // 뷰 네비게이션 관련
    @Published var isPresented = false
    @Published var path: [WriteStep] = []
    
    // 기록 작성 관련
    @Published var selectedDate: Date? = nil
    @Published var selectedSituation: SelectableItem?
    @Published var selectedEmotion: SelectableItem?
    
    
    let situationList: [SelectableItem] = [
        SelectableItem(emoji: "📚", mainText: "해보려 했는데", secondaryText: "일, 공부, 뭐든 시도했지만 잘 안된 순간들", type: .situation),
        SelectableItem(emoji: "🗣️", mainText: "말이 꼬였어", secondaryText: "소통 실수, 관계의 엇갈림", type: .situation),
        SelectableItem(emoji: "🛌", mainText: "나 자신에게 실망", secondaryText: "게으름, 감정 폭발, 루틴 실패 등", type: .situation),
        SelectableItem(emoji: "🤷", mainText: "뭐라 말 못할 실패", secondaryText: "이유는 모르겠지만... 그냥 실패한 날", type: .situation)
    ]
    
    let emotionList: [SelectableItem] = [
        SelectableItem(emoji: "🫠", mainText: "당황스러웠어요", secondaryText: "예상치 못한 실패에 당황했어요", type: .situation),
        SelectableItem(emoji: "😤", mainText: "속상했어요", secondaryText: "무언가 잘 안풀려서 답답했어요", type: .situation),
        SelectableItem(emoji: "😶‍🌫", mainText: "지쳤어요", secondaryText: "에너지가 빠지고 힘이 들었어요", type: .situation),
        SelectableItem(emoji: "🥲", mainText: "그래도 애썼어요", secondaryText: "실패 속에서도 나를 다독이고 싶었어요", type: .situation)
    ]
    
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

