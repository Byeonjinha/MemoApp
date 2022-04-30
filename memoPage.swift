//
//  memoPage.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI

struct memoPage: View {
    @EnvironmentObject var MemoData2 : MemoDataSheet
    
    var memoIndex : Int
  
    var body: some View {
        var memoContent = MemoData2.MemoData[memoIndex].content
        Text(MemoData2.MemoData[memoIndex].content)
            .onDisappear {
                for i in 0...MemoData2.MemoData.count-1 {
                    MemoData2.MemoData[i].secretBool2 = false
                }
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        MemoData2.MemoData.remove(at:memoIndex)
                    }) {
                        Image(systemName: "trash.fill")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                    Image(systemName:"square.and.pencil" )
                    }
                }
                //            ToolbarItem(placement: .primaryAction) {
                //                Image(systemName: "square.and.pencil")
                //            }
            }
        }
    
}

