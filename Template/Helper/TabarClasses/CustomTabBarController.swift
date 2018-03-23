//
//  CustomTabBarController.swift
//  Email
//
//  Created by Xiao Lin on 3/4/18.
//  Copyright © 2018 Xiao Lin. All rights reserved.
//

import UIKit
import SideMenu

let blueColor = UIColor(red: 6/255, green: 55/255, blue: 150/255, alpha: 1.0)
let yellowColor = UIColor(red: 252/255, green: 219/255, blue: 0, alpha: 1.0)

class CustomTabBarController: UITabBarController {
    
    @IBOutlet weak var customTabView: UIView!
    @IBOutlet weak var customTabScrollView: UIScrollView!
    
    @IBOutlet weak var btn_Updates: UIButton!
    @IBOutlet weak var btn_Skills: UIButton!
    @IBOutlet weak var btn_Chats: UIButton!
    @IBOutlet weak var btn_Emails: UIButton!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var btn_Back: UIButton!
    @IBOutlet weak var btn_Jobs: UIButton!
    @IBOutlet weak var btn_Money: UIButton!
    @IBOutlet weak var btn_Bazaar: UIButton!
    @IBOutlet weak var btn_Docs: UIButton!
    
    @IBOutlet weak var lbl_Updates: UILabel!
    @IBOutlet weak var lbl_Skills: UILabel!
    @IBOutlet weak var lbl_Chats: UILabel!
    @IBOutlet weak var lbl_Emails: UILabel!
    @IBOutlet weak var lbl_Jobs: UILabel!
    @IBOutlet weak var lbl_Money: UILabel!
    @IBOutlet weak var lbl_Bazaar: UILabel!
    @IBOutlet weak var lbl_Docs: UILabel!
    
    @IBOutlet weak var img_Updates: UIImageView!
    @IBOutlet weak var img_Skills: UIImageView!
    @IBOutlet weak var img_Chats: UIImageView!
    @IBOutlet weak var img_Emails: UIImageView!
    @IBOutlet weak var Jobs: UIImageView!
    @IBOutlet weak var img_Money: UIImageView!
    @IBOutlet weak var img_Bazaar: UIImageView!
    @IBOutlet weak var img_Docs: UIImageView!
    
    
    @IBOutlet weak var scrollViewContentWidthContraint: NSLayoutConstraint!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.moreNavigationController.navigationBar.isHidden = true
        Bundle.main.loadNibNamed("CustomTabUIView", owner: self, options: nil)
        self.customTabView.frame = CGRect(x: 0, y: self.view.frame.size.height-(55*HEIGHT_FACTOR), width: self.view.frame.size.width, height: 55*HEIGHT_FACTOR)
        self.view.addSubview(self.customTabView)
        customTabScrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height: 0)
        customTabScrollView.isPagingEnabled = true
        scrollViewContentWidthContraint.constant = self.view.frame.size.width*2
        self.bottomBarHidden()
        btn_Emails.setImage(UIImage(named:"Chat_Big_Icon_Blue"), for: .normal)
        lbl_Emails.textColor = blueColor
        img_Emails.isHidden = false
        
        self.selectedIndex = 2
    }
    
    func bottomBarHidden() {
        img_Updates.isHidden = true
        img_Skills.isHidden = true
        img_Chats.isHidden = true
        img_Emails.isHidden = true
        Jobs.isHidden = true
        img_Money.isHidden = true
        img_Bazaar.isHidden = true
        img_Docs.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onActionTapButton(_ sender: UIButton) {
        if !(sender.tag == 4 || sender.tag == 5) {
            self.UnSelectAllTabs()
            self.bottomBarHidden()
        }
        
        switch sender.tag {
        case 0:
            btn_Updates.setImage(UIImage(named:"update_blue_icon"), for: .normal)
            lbl_Updates.textColor = blueColor
            img_Updates.isHidden = false
            self.selectedIndex = 0
            break
        case 1:
            btn_Skills.setImage(UIImage(named:"skill_blue_icon"), for: .normal)
            lbl_Skills.textColor = blueColor
            img_Skills.isHidden = false
            self.selectedIndex = 1
            break
        case 2:
            btn_Chats.setImage(UIImage(named:"Chat_Big_Icon_Blue"), for: .normal)
            lbl_Chats.textColor = blueColor
            img_Chats.isHidden = false
            self.selectedIndex = 2
            break
        case 3:
            btn_Emails.setImage(UIImage(named:"mail_blue_icon"), for: .normal)
            lbl_Emails.textColor = blueColor
            img_Emails.isHidden = false
            self.selectedIndex = 3
            break
        case 4:
            customTabScrollView.setContentOffset(CGPoint(x:self.view.bounds.size.width, y:0), animated: true)
            break
        case 5:
            customTabScrollView.setContentOffset(CGPoint(x:0, y:0), animated: true)
            break
        case 6:
            btn_Jobs.setImage(UIImage(named:"jobs_blue_icon"), for: .normal)
            lbl_Jobs.textColor = blueColor
            Jobs.isHidden = false
            self.selectedIndex = 4
            break
        case 7:
            btn_Money.setImage(UIImage(named:"money_blue_icon"), for: .normal)
            lbl_Money.textColor = blueColor
            img_Money.isHidden = false
            self.selectedIndex = 5
            break
        case 8:
            btn_Bazaar.setImage(UIImage(named:"bazaar_blue_icon"), for: .normal)
            lbl_Bazaar.textColor = blueColor
            img_Bazaar.isHidden = false
            self.selectedIndex = 6
            break
        case 9:
            btn_Docs.setImage(UIImage(named:"document_blue_icon"), for: .normal)
            lbl_Docs.textColor = blueColor
            img_Docs.isHidden = false
            self.selectedIndex = 7
            break
        default:
            
            break
        }
        
    }

    func UnSelectAllTabs() {
        
        btn_Updates.setImage(UIImage(named:"update_gray_icon"), for: .normal)
        btn_Skills.setImage(UIImage(named:"skill_gray_icon"), for: .normal)
        btn_Chats.setImage(UIImage(named:"Chat_Big_Icon_Gray"), for: .normal)
        btn_Emails.setImage(UIImage(named:"mail_gray_icon"), for: .normal)
        btn_Next.setImage(UIImage(named:"next_arrow_big_gray_icon"), for: .normal)
        btn_Back.setImage(UIImage(named:"back_arrow_gray_icon"), for: .normal)
        btn_Jobs.setImage(UIImage(named:"jobs_gray_icon"), for: .normal)
        btn_Money.setImage(UIImage(named:"money_gray_icon"), for: .normal)
        btn_Bazaar.setImage(UIImage(named:"bazaar_gray_icon"), for: .normal)
        btn_Docs.setImage(UIImage(named:"document_gray_icon"), for: .normal)
        
        lbl_Updates.textColor = .black
        lbl_Skills.textColor = .black
        lbl_Chats.textColor = .black
        lbl_Emails.textColor = .black
        lbl_Jobs.textColor = .black
        lbl_Money.textColor = .black
        lbl_Bazaar.textColor = .black
        lbl_Docs.textColor = .black
    }
    
    
}
