//
//  DashBoardVC.swift
//  aoneteam
//
//  Created by khushboo on 3/5/18.
//  Copyright © 2018 khushboo baghel. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SideMenu

class DashBoardVC: ButtonBarPagerTabStripViewController{
    //Variable Declaration
    @IBOutlet var txtSearch: UITextField!
    override func viewDidLoad() {
        //Function Calling
         self.decorateUI()
        // change selected bar color
        settings.style.buttonBarBackgroundColor = dashboardSliderViewColor
        settings.style.buttonBarItemBackgroundColor = dashboardSliderViewColor
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
    
    //Custom Methods
    func decorateUI(){
        //Set TextField Padding
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:25*WIDTH_FACTOR, height:self.txtSearch.frame.height))
        txtSearch.leftView = paddingView
        txtSearch.leftViewMode = UITextFieldViewMode.always
    }
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let FriendsController = chatsStoryboard.instantiateViewController(withIdentifier: "FriendsVC")
        let FamilyController = chatsStoryboard.instantiateViewController(withIdentifier: "FamilyVC")
        let NetworkController = chatsStoryboard.instantiateViewController(withIdentifier: "NetworkVC")
        let AlumniController = chatsStoryboard.instantiateViewController(withIdentifier: "AlumniVC")
        let AllController = chatsStoryboard.instantiateViewController(withIdentifier: "AllVC")
        return [FriendsController, FamilyController,NetworkController,AlumniController,AllController]
    }
    
    // MARK: - Button Action

    @IBAction func openMenu(_ sender: UIButton) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func onTapOpenContacts(_ sender: UIButton) {
        let contactDashboardVC = contactsStoryboard.instantiateViewController(withIdentifier: "ContactDashboardVC") as! ContactDashboardVC
        self.navigationController?.pushViewController(contactDashboardVC, animated: true)
    }

}


