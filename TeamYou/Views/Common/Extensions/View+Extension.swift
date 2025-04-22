import SwiftUI

extension View {
    func snapshot(size: CGSize) -> UIImage {
        let controller = UIHostingController(rootView: self
                                                .frame(width: size.width, height: size.height))
        let view = controller.view

        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        window.rootViewController = controller
        window.makeKeyAndVisible()

        view?.bounds = window.bounds
        view?.backgroundColor = .clear
        view?.layoutIfNeeded()

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}
