import SwiftUI
import SwiftData

@main
struct TeamYouApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: Record.self)
    }
}
