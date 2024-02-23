//
//  Extension.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/6/6.
//

import Foundation
import UIKit

extension UITextField{
    var unwrappedText: String{
        text ?? ""
    }
}

extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}

extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String{
            return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
    
    static  func loadView<T>(formNib name: String, with type: T.Type) -> T{
        if let view = Bundle.main.loadNibNamed("TextViewIAView", owner: nil, options: nil)?.first as? T{
            return view
        }else{
            fatalError("加载\(type)类型的view失败")
        }
    }
}

extension UIViewController{
    func showTextHUD(_ title: String, _ subTitle: String? = nil){
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .text //不指定类型的话,会同时展示菊花和文本
        hub.label.text = title
        hub.detailsLabel.text = subTitle
        hub.hide(animated: true, afterDelay: 2)
    }
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapHideKeyboard))
        tap.cancelsTouchesInView = false //不取消根视图下的cell或者其他的点击
        view.addGestureRecognizer(tap)
    }
    @objc func viewTapHideKeyboard(){
        view.endEditing(true) //收起小键盘
    }
}
