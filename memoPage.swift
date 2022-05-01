//
//  memoPage.swift
//  memoApp (iOS)
//
//  Created by Byeon jinha on 2022/04/30.
//

import SwiftUI

struct memoPage: View {
    @EnvironmentObject var MemoData2 : MemoDataSheet
    @Environment(\.presentationMode) var presentationMode
    var memoIndex : Int
    private func alert() {
        let alert = UIAlertController(title: "삭제", message: "삭제하시겠습니까?", preferredStyle: .alert)
     
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
                MemoData2.MemoData[memoIndex].secretBool5.toggle()
                if memoIndex+2 == MemoData2.MemoData.count{
                    MemoData2.MemoData.remove(at:memoIndex)
                }
                else{
                    MemoData2.MemoData.remove(at:memoIndex)
                    presentationMode.wrappedValue.dismiss()
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
        var memoContent = MemoData2.MemoData[memoIndex].content
        VStack(alignment:.trailing){
        Text(String(MemoData2.MemoData[memoIndex].content.count)+" 자")
            Text(MemoData2.MemoData[memoIndex].content).padding(15).frame(width: 300, height: 500, alignment: .topLeading).border(.black)
 
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        alert()
                    }) {
                        Image(systemName: "trash.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: modifyPage(memoText: MemoData2.MemoData[memoIndex].content, secretBool: MemoData2.MemoData[memoIndex].secretBool, password3: MemoData2.MemoData[memoIndex].password2, memoIndex: memoIndex)){
                        Image(systemName:"square.and.pencil" )
                    }
                }
            }
        Spacer()
        }
    }
}

