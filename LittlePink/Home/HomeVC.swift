//
//  HomeVCViewController.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/5/6.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //选中条的颜色
//        settings.style.selectedBarBackgroundColor = UIColor.blue
//        settings.style.selectedBarHeight = 2
        settings.style.selectedBarVerticalAlignment = .bottom
        buttonBarView.selectedBar.backgroundColor = mainClolr
        buttonBarView.selectedBar.frame.size.height = 2
        
        //butten 的颜色
        settings.style.buttonBarItemBackgroundColor = .clear
//        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
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
        let fellowVC = storyboard!.instantiateViewController(identifier: kFellowVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoverVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearbyVCID)
        return [fellowVC,discoveryVC,nearbyVC]
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
