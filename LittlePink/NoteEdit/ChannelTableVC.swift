//
//  ChannelTableVC.swift
//  LittlePink
//
//  Created by yuming.zheng on 2024/2/23.
//

import UIKit
import XLPagerTabStrip

class ChannelTableVC: UITableViewController {

    var channel = ""
    var subChannel: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subChannel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kSubChannelCellID, for: indexPath)
        cell.textLabel?.text = "\(subChannel[indexPath.row])"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        // Configure the cell...

        return cell
    }


}

extension ChannelTableVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        IndicatorInfo(title: channel)
    }
    
    
}
