//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/6/6.
//

import UIKit


class NoteEditVC: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var videoUrl: URL?
    var isVideo: Bool{ videoUrl != nil}
    var photos = [
        UIImage(named: "1")!,UIImage(named: "2")!
    ]
    var photoCount: Int{ photos.count}
    var textViewIAView: TextViewIAView{ textView.inputAccessoryView as! TextViewIAView }
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
        
    }
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    @IBAction func TFEndOnExit(_ sender: Any) {
    }
    
    @IBAction func TFEdieChanged(_ sender: Any) {
        guard titleTextField.markedTextRange == nil else{return} //防止苹果拼音键盘高亮字符占用
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount{
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            showTextHUD("标题最多输入\(kMaxNoteTitleCount)个字符哦")
            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
        }
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
    

}
extension NoteEditVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
//        textViewIAView.textCountLabel.text = "\(textView.text.count)"
        guard textView.markedTextRange == nil else{return}
        textViewIAView.currentTextCount = textView.text.count
        
    }
}

//extension NoteEditVC: UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let isExceed = range.location <= kMaxNoteTitleCount - string.count
//        if !isExceed{
//            showTextHUD("标题最多输入\(kMaxNoteTitleCount)个字符哦")
//        }
//        
//        return isExceed
//    }
//}
