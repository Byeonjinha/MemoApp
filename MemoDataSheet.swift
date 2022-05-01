//
//  MemoData.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/04/30.
//

import Foundation

final class MemoDataSheet : ObservableObject{
@Published var MemoData : [MemoList] = [
//    MemoList(content : "얼룩말은 하루에 20km를 달립니다. 그리고 50kg의 풀을 먹으며 살고 있습니다.",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""),
//    MemoList(content : "소는 하루에 15km를 달립니다.",secretBool: true,secretBool2 : false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "12345", password1: ""),
//    MemoList(content : "말은 하루에 30km를 달립니다.",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""),
//    MemoList(content : "코끼리는은 하루에 50km를 달립니다.",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""),
//    MemoList(content : "",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, secretBool5: false, password2: "", password1: ""),
    // secretBool 비밀글 유무 secretBool2
]
    @Published var contentList : [String] = [
//        "얼룩말은 하루에 20km를 달립니다. 그리고 50kg의 풀을 먹으며 살고 있습니다.",
//        "소는 하루에 15km를 달립니다.",
//        "말은 하루에 30km를 달립니다.",
//        "코끼리는은 하루에 50km를 달립니다."
    ]

    
  
}
