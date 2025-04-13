import SwiftData
import SwiftUI

struct RecordSampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(for: Record.self, configurations: .init(isStoredInMemoryOnly: true))
        Record.sampleData.forEach { container.mainContext.insert($0) }
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var dailyScrumsSampleData: Self = .modifier(RecordSampleData())
}
