//
//  GroupContactsVC.swift
//  aoneteam
//
//  Created by khushboo on 3/5/18.
//  Copyright © 2018 khushboo baghel. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class GroupContactsVC: ButtonBarPagerTabStripViewController,IndicatorInfoProvider{
    
    override func viewDidLoad() {
        //Function Calling
        settings.style.buttonBarBackgroundColor = dashboardSubSliderViewColor
        settings.style.buttonBarItemBackgroundColor = dashboardSubSliderViewColor
        settings.style.selectedBarBackgroundColor = dashboardSliderSelectedTitleColor
        settings.style.buttonBarItemFont = UIFont(name: ".SFUIText-Semibold", size: 11*WIDTH_FACTOR)!
        settings.style.selectedBarHeight = 4.0*HEIGHT_FACTOR
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = dashboardSliderSelectedTitleColor
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = dashboardSliderSelectedTitleColor
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let allGroupFriendsVC = contactsStoryboard.instantiateViewController(withIdentifier: "GroupFriendsVC")
        let allGroupFamilyVC = contactsStoryboard.instantiateViewController(withIdentifier: "GroupFamilyVC")
        let allGroupNetworkVC = contactsStoryboard.instantiateViewController(withIdentifier: "GroupNetworkVC")
        let allGroupAlumniVC = contactsStoryboard.instantiateViewController(withIdentifier: "GroupAlumniVC")
        let allGroupVC = contactsStoryboard.instantiateViewController(withIdentifier: "AllGroupVC")
        return [allGroupFriendsVC, allGroupFamilyVC,allGroupNetworkVC,allGroupAlumniVC,allGroupVC]
    }
    // MARK: - PagerTabStripDataSource
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Groups")
    }
    
}


