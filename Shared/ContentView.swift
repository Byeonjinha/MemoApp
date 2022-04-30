//
//  ContentView.swift
//  Shared
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI

struct Topic : Identifiable, Equatable {
    var id = UUID()
    var content = String
}


struct ContentView: View {
    memoList
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
]
