import SwiftUI
import SwiftData

struct MainRecordList: View {
    @Environment(\.modelContext) private var modelContext
    
    let month: Int
    
    @Query private var recordList: [Record]
    @State private var selectedRecord: Record?
    
    init(month: Int) {
        self.month = month
        _recordList = Query(filter: #Predicate<Record> { $0.month == month }, sort: [.init(\.day, order: .reverse)])
    }
    
    private var groupedRecords: [Int: [Record]] {
        Dictionary(grouping: recordList, by: { $0.day })
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                if recordList.isEmpty {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("아직 기록을 작성하지 않았어요 🥲")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                } else {
                    ForEach(groupedRecords.keys.sorted(by: >), id: \.self) { day in
                        VStack(alignment: .leading) {
                            Text("\(month)월 \(day)일")
                                .foregroundColor(.alabaster)
                                .font(.system(size: 18, weight: .medium))
                                .padding(.bottom, 16)
                            
                            ForEach(groupedRecords[day] ?? [], id: \.id) { record in
                                RecordCard(category: record.situation, emotion: record.emotion)
                                    .padding(.bottom, 12)
                                    .onTapGesture {
                                        selectedRecord = record
                                    }
                            }
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
