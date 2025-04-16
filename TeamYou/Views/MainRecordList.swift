import SwiftUI

struct MainRecordList: View {
    @State var month = "4"
    @State var day = "11"
    @State var isEmptyRecordList = false
    @State private var selectedRecord: Record?
    
    var recordList: [Record]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("\(month)월 \(day)일의 기록")
                    .foregroundColor(.alabaster)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 16)
                if isEmptyRecordList {
                    HStack(alignment: .center) {
                        Text("아직 기록을 작성하지 않았어요 🥲")
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.gray1)
                } else {
                    ForEach(recordList, id: \.id) { record in
                        RecordCard(category: record.situation, emotion: record.emotion)
                            .padding(.bottom, 16)
                            .onTapGesture {
                                selectedRecord = record
                            }
                    }
                }
            }
            .background(.gray1)
            .frame(maxWidth: .infinity)
            .navigationDestination(item: $selectedRecord) { record in
                RecordDetailView(record: record)
            }
        }
    }
}
