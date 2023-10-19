//
//  ContentView.swift
//  KeypathsInSwiftUI
//
//  Created by admin on 10/19/23.
//

import SwiftUI

struct MyDataModel {
    let id = UUID().uuidString
    let title: MovieTitle
    let count: Int
    let date: Date
}

struct MovieTitle {
    let primary: String
    let secondary: String
}

struct ContentView: View {
    
    //@Environment(\.dismiss) var dismiss
    //@AppStorage("user_count") var userCount: Int = 0
    
    @State private var screenTitle: String = ""
    
    var body: some View {
        Text("Key paths")
            .onAppear() {
                let item = MyDataModel(title: MovieTitle(primary: "Alpha", secondary: "Beta"), count: 1, date: .now)
                
                let title = item.title.primary
                let title2 = item[keyPath: \.title.primary]
                
                screenTitle = title2
            }
    }
}

#Preview {
    ContentView()
}
