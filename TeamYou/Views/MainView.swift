import SwiftUI

struct MainView: View {
    @State var isLaunching = true
    var body: some View {
        if isLaunching {
            SplashView()
                .opacity(isLaunching ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeIn(duration: 1)) {
                            isLaunching = false
                        }
                    }
                }
        } else {
            NavigationStack {
                VStack(alignment: .leading, spacing: 24) {
                            Spacer()
                            VStack(alignment: .leading, spacing: 32) {
                                HStack {
                                    Image("AppIconSmall")
                                        .imageScale(.large)
                                    Text("실패 응원단")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.accent)
                                }
                                .padding(.leading, 20)
                                CalendarView()
                            }
                            ZStack() {
                                HStack {
                                    MainRecordList(recordList: Record.sampleData)
                                }
                                VStack {
                                    Spacer()
                                    LargeButton()
                                }
                            }
                        }
                        .background(.gray1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
        }
    }

#Preview {
    MainView()
}
