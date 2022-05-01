//
//  modifyPage.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/05/01.
//

import SwiftUI
struct modifyPage: View {
    @EnvironmentObject var MemoData2 : MemoDataSheet
    @Environment(\.presentationMode) var presentationMode
    @State var memoText : String
    @State private var font: UIFont = UIFont(name: "ArialHebrew", size: UIFont.labelFontSize)!
    @State var secretBool : Bool
    @State var password3 : String
    var memoIndex : Int
    var body: some View {
        NavigationView{
            VStack(alignment:.trailing){
            Text(String(memoText.count)+" 자")
            TextView(text: $memoText, font: $font).padding(15).frame(width: 300, height: 400, alignment:.top).border(.black)
                Toggle("비밀글", isOn: $secretBool).frame(width:300)
                if secretBool == true{
                    TextField("비밀번호를 입력하세요.",text: $password3).padding(15).frame(width:300).border(.black)
                }
            Spacer()
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:  {
                        if secretBool == false &&  MemoData2.MemoData[memoIndex].secretBool != true{
                            MemoData2.MemoData[memoIndex].content =  memoText
                            MemoData2.MemoData[memoIndex].secretBool = false
                            MemoData2.MemoData[memoIndex].secretBool2 = false
                            MemoData2.MemoData[memoIndex].secretBool3 = false
                            MemoData2.MemoData[memoIndex].secretBool4 = false
                            MemoData2.MemoData[memoIndex].secretBool5 = false
                            MemoData2.MemoData[memoIndex].password2 =  ""
                            MemoData2.MemoData[memoIndex].password1 = ""
                            presentationMode.wrappedValue.dismiss()
                        }
                        else if secretBool != false {
                            MemoData2.MemoData[memoIndex].content =  memoText
                            MemoData2.MemoData[memoIndex].secretBool = true
                            MemoData2.MemoData[memoIndex].secretBool2 = false
                            MemoData2.MemoData[memoIndex].secretBool3 = false
                            MemoData2.MemoData[memoIndex].secretBool4 = false
                            MemoData2.MemoData[memoIndex].secretBool5 = false
                            MemoData2.MemoData[memoIndex].password2 =  password3
                            MemoData2.MemoData[memoIndex].password1 = password3
                        }
                        else if secretBool == false &&  MemoData2.MemoData[memoIndex].secretBool == true{
                            MemoData2.MemoData[memoIndex].content =  memoText
                            MemoData2.MemoData[memoIndex].secretBool = false
                            MemoData2.MemoData[memoIndex].secretBool2 = false
                            MemoData2.MemoData[memoIndex].secretBool3 = false
                            MemoData2.MemoData[memoIndex].secretBool4 = false
                            MemoData2.MemoData[memoIndex].secretBool5 = false
                            MemoData2.MemoData[memoIndex].password2 =  ""
                            MemoData2.MemoData[memoIndex].password1 = ""
                        
                        }
                    })
                    {
                        Text("Done")
                        
                    }
                }
            }
     
    
    }
}

