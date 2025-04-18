import SwiftUI

struct MainView: View {
    @StateObject private var writeVM = WriteFlowViewModel()
    @State private var showDateSheet = false
    @State private var selectedYear = Calendar.current.component(.year, from: Date())
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var isLaunching = true
    @State private var isShownFullScreenCover = false
    
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
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    showDateSheet = true
                                }) {
                                    HStack(spacing: 12) {
                                        Text("\(String(selectedYear))년 \(String(selectedMonth))월")
                                            .font(.system(size: 20, weight: .semibold))
                                        Image(systemName: "calendar")
                                    }
                                    .foregroundColor(.alabaster)
                                }
                                .sheet(isPresented: $showDateSheet) {
                                    CustomDatePicker(
                                        selectedYear: $selectedYear,
                                        selectedMonth: $selectedMonth,
                                        isPresented: $showDateSheet
                                    )
                                }
                                Spacer()
                            }
                            
                            MainRecordList(month: selectedMonth)
                                .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 32)
                    
                    VStack {
                        Button(action: {
                            writeVM.isPresented = true
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
                    .fullScreenCover(isPresented: $writeVM.isPresented) {
                        WriteView()
                            .environmentObject(writeVM)
                    }
                }
                .background(.gray1)
                .ignoresSafeArea(edges: .top)
            }
        }
    }
}
