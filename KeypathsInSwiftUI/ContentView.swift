//
//  ContentView.swift
//  KeypathsInSwiftUI
//
//  Created by admin on 10/19/23.
//

import SwiftUI

struct MyDataModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}

//struct MovieTitle {
//    let primary: String
//    let secondary: String
//}

struct ContentView: View {
    
    //@Environment(\.dismiss) var dismiss
    //@AppStorage("user_count") var userCount: Int = 0
    
    //@State private var screenTitle: String = ""
    
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        List {
            ForEach(dataArray) { item in
                VStack(alignment: .leading) {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
                .font(.headline)
            }
        }
            .onAppear() {
                let array = [
                    MyDataModel(title: "One", count: 1, date: .now),
                    MyDataModel(title: "Two", count: 2, date: .distantFuture),
                    MyDataModel(title: "Three", count: 3, date: .distantPast),
                ]
                
                //let newArray = array.sorted { item1, item2 in
                //    return item1.count < item2.count
                //}
                
                let newArray = array.sorted { item1, item2 in
                    return item1[keyPath: \.count] < item2[keyPath: \.count]
                }
                
                dataArray = array
                
                //let item = MyDataModel(title: "One", count: 1, date: .now)
                
                //let title = item.title
                //let title2 = item[keyPath: \.title]
                
                //screenTitle = title2
            }
    }
}

#Preview {
    ContentView()
}
