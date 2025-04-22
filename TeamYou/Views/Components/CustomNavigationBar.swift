import SwiftUI

struct CustomNavigationBar: View {
    var showLeftButton = false
    var showRightButton = false
    var leftAction: (() -> Void)? = nil
    var rightAction: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            if showLeftButton {
                Button(action: leftAction ?? {}) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.alabaster)
                }
            } else {
                Spacer().frame(width: 44)
            }
            
            Spacer()
            
            if showRightButton {
                Button(action: rightAction ?? {}) {
                    Image(systemName: "xmark")
                        .foregroundStyle(.alabaster)
                }
            } else {
                Spacer().frame(width: 44)
            }
        }
        .padding(.vertical, 12)
    }
}
