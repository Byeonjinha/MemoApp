//
//  memoAppApp.swift
//  Shared
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI

@main
struct memoAppApp: App {
    @StateObject private var MemoData = MemoDataSheet()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MemoData)
        }
    }
}
