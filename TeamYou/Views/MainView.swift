import SwiftUI

struct MainView: View {
    @State private var year = "2025"
    @State private var month = "4"
    @State private var isLaunching = true
    @State private var isShownFullScreenCover = false
    
    var body: some View {
        if isLaunching {
            SplashView()
                .opacity(isLaunching ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation(.easeIn(duration: 1)) {
                            isLaunching = false
                        }
                    }
                }
        } else {
            NavigationStack {
                ZStack(alignment: .bottom) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 32) {
                            Spacer()
                            
                            HStack {
                                Image("AppIconSmall")
                                    .imageScale(.large)
                                Text("실패 응원단")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.accent)
                            }
                            .padding(.leading, 20)
                            
                            HStack(spacing: 8) {
                                Spacer()
                                
                                Text("\(year)년 \(month)월")
                                    .font(.system(size: 20, weight: .semibold))
                                Image(systemName: "chevron.down")
                                
                                Spacer()
                            }
                            .foregroundStyle(.alabaster)
                            
                            MainRecordList(recordList: Record.sampleData)
                                .padding(.horizontal, 20)
                        }
                        .padding(.top, 32)
                    }
                    
                    VStack {
                        Button(action: {
                            self.isShownFullScreenCover.toggle()
                        }) {
                            Text("기록하기")
                                .font(.body)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.gray1)
                                .background(.accent)
                                .cornerRadius(48)
                                .padding(.horizontal, 16)
                        }
                        .padding(.top, 12)
                        .background(.gray1)
                    }
                    .fullScreenCover(isPresented: $isShownFullScreenCover) {
                        WriteView()
                    }
                }
                .background(.gray1)
                .ignoresSafeArea(edges: .top)
            }
        }
    }
}
