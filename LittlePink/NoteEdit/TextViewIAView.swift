//
//  TextViewIAView.swift
//  LittlePink
//
//  Created by yuming.zheng on 2024/2/22.
//

import UIKit

class TextViewIAView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var textCountStackView: UIStackView!
    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var maxTextCountLabel: UILabel!
    
    var currentTextCount: Int = 0{
        didSet{
            if currentTextCount <= kMaxNoteTextCount{
                doneBtn.isHidden = false
                textCountStackView.isHidden = true
            }else{
                textCountLabel.text = "\(currentTextCount)"
                doneBtn.isHidden = true
                textCountStackView.isHidden = false
            }
        }
    }
    
}
