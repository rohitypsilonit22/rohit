//
//  DashBoardVC.swift
//  aoneteam
//
//  Created by khushboo on 3/5/18.
//  Copyright © 2018 khushboo baghel. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ContactDashboardVC: ButtonBarPagerTabStripViewController{
    //Variable Declaration
    override func viewDidLoad() {
        //Function Calling
        // change selected bar color
        settings.style.buttonBarBackgroundColor = dashboardSliderViewColor
        settings.style.buttonBarItemBackgroundColor = dashboardSliderViewColor
        settings.style.selectedBarBackgroundColor = dashboardSliderSelectedTitleColor
        settings.style.buttonBarItemFont = UIFont(name: ".SFUIText-Semibold", size: 10*WIDTH_FACTOR)!
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
        let allContactVC = contactsStoryboard.instantiateViewController(withIdentifier: "AllContactVC")
        let contactContactsVC = contactsStoryboard.instantiateViewController(withIdentifier: "ContactContactsVC")
        let memberContactsVC = contactsStoryboard.instantiateViewController(withIdentifier: "MemberContactsVC")
        let groupContactsVC = contactsStoryboard.instantiateViewController(withIdentifier: "GroupContactsVC")
        let listContactsVC = contactsStoryboard.instantiateViewController(withIdentifier: "ListContactsVC")
        return [allContactVC, contactContactsVC,memberContactsVC,groupContactsVC,listContactsVC]
    }
    
    // MARK: - Button Action

    @IBAction func openTapBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}


