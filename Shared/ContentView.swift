//
//  ContentView.swift
//  Shared
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI

struct MemoList : Identifiable, Equatable,Hashable {
    var id = UUID()
    var content : String
    var secretBool : Bool
    var secretBool2 : Bool
    var secretBool3 : Bool
    var secretBool4 : Bool
    var password2 : String
}

//var MemoData : [MemoList] = [
//    MemoList(content : "얼룩말은 하루에 20km를 달립니다.",secretBool: false,secretBool2: false),
//    MemoList(content : "소는 하루에 15km를 달립니다.",secretBool: true,secretBool2 : false),
//    MemoList(content : "말은 하루에 30km를 달립니다.",secretBool: false,secretBool2: false),
//]

struct ContentView: View {
    @EnvironmentObject var MemoData2 : MemoDataSheet
    @State var password : String
    var body: some View {
        NavigationView{
            VStack( alignment: .leading, spacing: 15){
                ForEach(MemoData2.MemoData.indices, id: \.self) {
                    let k = $0
                    if k == MemoData2.MemoData.count-1 {
                    
                    }else{
                    if MemoData2.MemoData[k].secretBool {
                        ZStack{
                        HStack{
                        Text( "비밀메모 입니다")
                            .padding(10)
                            .border(.black)
                        
                          
                            Button(action:{ MemoData2.MemoData[k].secretBool2.toggle()
                            }){ Image(systemName: "lock.fill")}
                        }
                            if MemoData2.MemoData[k].secretBool2 == true {
                                
                                if MemoData2.MemoData[k].secretBool3 == true{
                                    
                                Rectangle().frame(width: 200, height: 40).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1))
                                .alert(isPresented: $MemoData2.MemoData[k].secretBool4 ) {
                                       Alert(title: Text("비밀번호가 틀립니다."), message: Text("올바른 비밀번호를 입력해 주세요."))
                                   }
                                .overlay( TextField(
                                        "비밀번호", text:  $password ).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)))
                                    Button(action: { MemoData2.MemoData[k].secretBool3 = !MemoData2.MemoData[k].secretBool3 }){Image(systemName: "eye.fill")}.offset(x:50)
                                    if password == MemoData2.MemoData[k].password2 {
                                    NavigationLink(destination:  memoPage(memoIndex : k)){
                                        Image(systemName: "lock.open.fill")}.offset(x:80)
                                    }
                                    else{
                                Button(action: {
                                    MemoData2.MemoData[k].secretBool4.toggle()
                                }){Image(systemName: "lock.open.fill")}.offset(x:80)
                                    }
                                }
                                else{
                                    Rectangle().frame(width: 200, height: 40).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1))
                                    .alert(isPresented: $MemoData2.MemoData[k].secretBool4 ) {
                                           Alert(title: Text("비밀번호가 틀립니다."), message: Text("올바른 비밀번호를 입력해 주세요."))
                                       }
                                    .overlay( SecureField(
                                            "비밀번호", text:  $password ).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)))
                                    Button(action: { MemoData2.MemoData[k].secretBool3.toggle() }){Image(systemName: "eye.fill")}.offset(x:50)
                                    
                                    if password == MemoData2.MemoData[k].password2 {
                                    NavigationLink(destination:  memoPage(memoIndex : k)){
                                        Image(systemName: "lock.open.fill")}.offset(x:80)
                                    }
                                    else{
                                    Button(action: {
                                        MemoData2.MemoData[k].secretBool4.toggle()
                                    }){Image(systemName: "lock.open.fill")}.offset(x:80)
                                    }
                                }
                            }
                    }
                    }
                    else {NavigationLink(destination:  memoPage(memoIndex : k)){
                        Text(MemoData2.MemoData[k].content)
                            .padding(10)
                            .border(.black)
                    }
                    }
                    }
                }
                Spacer()
            }
        }
    }
}

