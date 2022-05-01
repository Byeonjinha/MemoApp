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
    var secretBool5 : Bool
    var password2 : String
    var password1 : String
  
}

struct ContentView: View {
    @EnvironmentObject var MemoData2: MemoDataSheet
    @State var searchText: String = ""
    @State var memoIndex : Int = 0
    @State var goToDetail = false
    private func alert2() {
        let alert = UIAlertController(title: "비밀번호", message: "비밀번호를 입력해주세요.", preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = "Enter some text"
        }
        alert.textFields![0].isSecureTextEntry = true
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
            if MemoData2.MemoData[memoIndex].password2 != alert.textFields![0].text {
                showAlert(alert: alert)
            }
            else{
                goToDetail.toggle()
            }
        })
        showAlert(alert: alert)
    }

    func showAlert(alert: UIAlertController) {
        if let controller = topMostViewController() {
            controller.present(alert, animated: true)
        }
    }

    private func keyWindow() -> UIWindow? {
        return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
    }

    private func topMostViewController() -> UIViewController? {
        guard let rootController = keyWindow()?.rootViewController else {
            return nil
        }
        return topMostViewController(for: rootController)
    }

    private func topMostViewController(for controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return topMostViewController(for: presentedController)
        } else if let navigationController = controller as? UINavigationController {
            guard let topController = navigationController.topViewController else {
                return navigationController
            }
            return topMostViewController(for: topController)
        } else if let tabController = controller as? UITabBarController {
            guard let topController = tabController.selectedViewController else {
                return tabController
            }
            return topMostViewController(for: topController)
        }
        return controller
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Spacer().frame(height:50)
                ForEach(MemoData2.MemoData.indices , id: \.self) { k in
                    
                    if k == MemoData2.MemoData.count - 1 {
                    } else {
                        if !MemoData2.MemoData[k].secretBool {
                            NavigationLink(destination: memoPage(memoIndex : k)) {
                                Text(MemoData2.MemoData[k].content)
                                    .foregroundColor(.black)
                                    .frame(width: 300, height:25, alignment: .leading)
                                    .padding(10)
                                .border(.black)
                            }
                            } else {
                                Button(action:{
                                    memoIndex = k
                                    alert2()
                                }){
                                Text("비밀글 입니다.")
                                    .foregroundColor(.black)
                                    .frame(width: 300, height:25, alignment: .leading)
                                    .padding(10)
                                .border(.black)
                                }  .background(NavigationLink(destination: memoPage(memoIndex: memoIndex), isActive: self.$goToDetail) { EmptyView()
                                })
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: editPage(memoText: "", password3: "")) {
                        Image(systemName: "plus")}
                }
            }
        }
        .searchable(text: self.$searchText) {
            ForEach(MemoData2.contentList.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                                   searchText in Text(searchText)    .lineLimit(1)
                               }
        }
    }
}
