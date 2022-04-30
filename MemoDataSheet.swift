//
//  MemoData.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/04/30.
//

import Foundation

final class MemoDataSheet : ObservableObject{
@Published var MemoData : [MemoList] = [
    MemoList(content : "얼룩말은 하루에 20km를 달립니다.",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, password2: "1234"),
    MemoList(content : "소는 하루에 15km를 달립니다.",secretBool: true,secretBool2 : false, secretBool3: false, secretBool4: false, password2: "12345"),
    MemoList(content : "말은 하루에 30km를 달립니다.",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, password2: "123"),
    MemoList(content : "",secretBool: false,secretBool2: false, secretBool3: false, secretBool4: false, password2: ""),
]
}
