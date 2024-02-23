//
//  NoteEditVC-Config.swift
//  LittlePink
//
//  Created by yuming.zheng on 2024/2/22.
//

import Foundation

extension NoteEditVC{
    func config() {
        photoCollectionView.dragInteractionEnabled = true // 开启拖拽手势交互
        photoCollectionView.keyboardDismissMode = .onDrag
        titleCountLabel.text = "\(kMaxNoteTitleCount)"
        hideKeyboardWhenTappedAround()
        //        textView.textContainerInset = .zero//去除上下缩进
        textView.textContainer.lineFragmentPadding = 0 //去除左右缩进
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -textView.textContainer.lineFragmentPadding, bottom: 0, right: -textView.textContainer.lineFragmentPadding)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6 //行间距设置
        //        paragraphStyle.lineHeightMultiple = 2 //行高乘2
        let typingAttributes:[NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.secondaryLabel
        ]
        textView.typingAttributes = typingAttributes
        textView.tintColorDidChange()
        textView.inputAccessoryView = Bundle.loadView(formNib: "TextViewIAView", with: TextViewIAView.self)
        textViewIAView.doneBtn.addTarget(self, action: #selector(resignTextView), for: .touchUpInside)
        textViewIAView.maxTextCountLabel.text = "/\(kMaxNoteTextCount)"
        textViewIAView.textCountStackView.isHidden = true
        
        
        
    }
}

extension NoteEditVC{
    @objc func resignTextView(){
        textView.resignFirstResponder()
    }
}
