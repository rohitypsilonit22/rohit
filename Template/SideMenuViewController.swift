//
//  SideMenuTableViewController.swift
//  Email
//
//  Created by Xiao Lin on 3/5/18.
//  Copyright © 2018 Xiao Lin. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var img_ProfileIcon: UIImageView!
    @IBOutlet weak var lbl_ProfileName: UILabel!
    @IBOutlet weak var lbl_ProfileStatus: UILabel!
    var settingList = [[String: String]]()
    @IBOutlet var settingView: UIView!
    @IBOutlet var mainVIew: UIView!
    @IBOutlet var tableMenu: UITableView!
    @IBOutlet weak var tbl_View: UITableView!
    var setList = [[String: String]]()
    var isPresentView = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableViewData()
    }
    override func viewDidLayoutSubviews() {
        img_ProfileIcon.layoutIfNeeded()
        img_ProfileIcon.layer.borderWidth = 1
        img_ProfileIcon.layer.masksToBounds = false
        img_ProfileIcon.layer.borderColor = UIColor.clear.cgColor
        img_ProfileIcon.layer.cornerRadius = img_ProfileIcon.frame.height/2
        img_ProfileIcon.clipsToBounds = true
    }
    func setTableViewData() {
        isPresentView = false
        if isPresentView{
            self.settingView.isHidden = false
            self.mainVIew.isHidden = true
        }else{
            self.settingView.isHidden = true
            self.mainVIew.isHidden = false
        }
        setList =  [["Image": "img_profile" ,"name" : "Jobseeker Profile"], ["Image": "feed_job" ,"name" : "Jobs Home"],["Image": "job_search" ,"name" : "Job Search"],["Image": "interview" ,"name" : "Interviews"],["Image": "gray_alertMail" ,"name" : "Alert Jobs"],["Image": "gray_reminder" ,"name" : "Reminder Apply"]]
         settingList =  [["name": "Edit Profile","Image": "profile_edit_black_icon"],["name": "Credentials","Image": "credential_black_icon"],["name": "Notifications","Image": "notifications_on_black_icon"],["name": "Privacy","Image": "privacy_black_icon"],["name": "About","Image": "about_black_icon"],["name": "Invite People","Image": "invite_people_large_black"],["name": "Share SocialxApp","Image": "share_black_icon"],["name": "Rate and Feedback","Image": "star_and_feedback_black_icon"],["name": "Help and Support","Image": "help_black_icon"]]
    }
   
    //TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableMenu{
        return setList.count
        }else{
            return settingList.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46.0*HEIGHT_FACTOR
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsViewTableCell") as! SettingsViewTableCell
        if tableView == self.tableMenu{
        cell.setSidePanelData(SidePanelData: setList[indexPath.row] as NSDictionary)
        }else{
        cell.setSettingData(SettingData: settingList[indexPath.row] as NSDictionary)
        }
        return cell
    }
    
 
    @IBAction func onTapContacts(_ sender: Any) {
        let contactDashboardVC = contactsStoryboard.instantiateViewController(withIdentifier: "ContactDashboardVC") as! ContactDashboardVC
        self.navigationController?.pushViewController(contactDashboardVC, animated: true)
    }
    
    @IBAction func onTapSetting(_ sender: Any) {
        isPresentView = true
        if isPresentView{
            self.settingView.isHidden = false
            self.mainVIew.isHidden = true
        }
    }
    
    @IBAction func onTapBack(_ sender: Any) {
        isPresentView = false
        if !isPresentView{
            self.settingView.isHidden = true
            self.mainVIew.isHidden = false
        }
    }
}
