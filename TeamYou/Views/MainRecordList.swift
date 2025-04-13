import SwiftUI

struct MainRecordList: View {
    @State var month = "4"
    @State var day = "11"
    @State var isEmptyRecordList = false
    var recordList: [Record]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(month)월 \(day)일의 기록")
                .foregroundColor(.alabaster)
                .font(.system(size: 18, weight: .medium))
                .padding(.leading, 20)
            
            if (isEmptyRecordList) {
                ZStack {
                    Text("아직 기록을 작성하지 않았어요 🥲")
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(.gray1)
            }
            else {
                List(recordList, id: \.id) { record in
                        NavigationLink(destination: RecordDetailView(record: record)) {
                            RecordCard (category: record.category, emotion: record.emotion)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
            }
        }
        .background(.gray1)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MainRecordList(recordList: Record.sampleData)
}
