//
//  secretPage.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI
struct TextView : UIViewRepresentable{
    @Binding var text :String
    @Binding var font: UIFont
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
        
    }
    func makeUIView(context:Context) -> UITextView {
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        return myTextView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = font
    }
    class Coordinator : NSObject, UITextViewDelegate{
        var parent : TextView
        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }
        func textViewDidChange(_ textView: UITextView) {
            if textView.text.count < 1000 {
            self.parent.text = textView.text
            }
            else {
                textView.text.removeLast()
            }
        }
    }
}

struct editPage: View {
    @EnvironmentObject var MemoData2 : MemoDataSheet
    @Environment(\.presentationMode) var presentationMode
    @State var memoText : String
    @State private var font: UIFont = UIFont(name: "ArialHebrew", size: UIFont.labelFontSize)!
    @State var secretBool : Bool = false
    @State var password3 : String
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
                ToolbarItem(placement: .primaryAction) {
                    Button(action:  {
                        
                        MemoData2.MemoData.popLast()
                        if secretBool == false{
                            MemoData2.MemoData.append(MemoList(content : memoText ,secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""))
                            MemoData2.contentList.append(memoText)
                        } else {
                            MemoData2.MemoData.append(MemoList(content : memoText ,secretBool: true,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: password3, password1: ""))
                            MemoData2.contentList.append(memoText)
                        }
                        MemoData2.MemoData.append(MemoList(content : "",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""))
                        presentationMode.wrappedValue.dismiss() }){
                               Text("Done")}
                }
            }
     
    
    }
}

