//
//  DiscoverVC.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/5/6.
//

import UIKit
import XLPagerTabStrip

class DiscoverVC: ButtonBarPagerTabStripViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settings.style.selectedBarHeight = 0
        buttonBarView.selectedBar.frame.size.height = 0
        buttonBarView.selectedBar.backgroundColor = .clear
        
        buttonBarView.backgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        containerView.bounces = false
        
        //改变bar样式的变化
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        DispatchQueue.main.async {
            self.moveToViewController(at: 1)
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
//        for channel in kChannels{
//            let vc = storyboard!.instantiateViewController(withIdentifier: kWaterFallVCID) as! WaterFallVC
//            vc.channel = channel
//        }
        let vcs = kChannels.map { channel in
            let vc = storyboard!.instantiateViewController(withIdentifier: kWaterFallVCID) as! WaterFallVC
            vc.channel = channel
            return vc
        }
        return vcs
    }
    
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: "发现")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
