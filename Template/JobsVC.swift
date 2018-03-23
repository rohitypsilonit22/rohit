//
//  JobsVC.swift
//  aoneteam
//
//  Created by khushboo on 3/5/18.
//  Copyright © 2018 khushboo baghel. All rights reserved.
//

import UIKit
import SideMenu

class JobsVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnMyJob:UIButton!
    @IBOutlet weak var btnFavourts:UIButton!
    @IBOutlet weak var btnJobList:UIButton!
    @IBOutlet weak var tfSearch:UITextField!
    @IBOutlet weak var viewJob_Favrates: UIView!
    @IBOutlet weak var viewMyJobs: UIView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet var tblView: UITableView!
    
    //MARK:- view JobList & Favourites Outlets
    @IBOutlet weak var btnToday_viewCandidate:UIButton!
    @IBOutlet weak var btnAll_SaveCandidate:UIButton!
    @IBOutlet weak var lblViewJob_Fav: UILabel!
    
    //MARK:- view My Jobs Outlets
    @IBOutlet weak var btnApplied:UIButton!
    @IBOutlet weak var btnShorlist:UIButton!
    @IBOutlet weak var btnRejected:UIButton!
    @IBOutlet weak var lblMyJobs: UILabel!
    
    //All Variables
    var aryJobList = NSMutableArray()
    var aryMyJobs = NSMutableArray()
    var checkStatus = ""
    var myJobStatus = ""

    let clrApplied = UIColor(red:0.02, green:0.19, blue:0.47, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearch.layer.cornerRadius = 5
        viewMyJobs.isHidden = true
        aryJobList = ["Leading Marketing Manager","Leading UI Designer","Product Designer"]
        myJobStatus = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var boolVal = false
    
    //MARK:- Action Open Side panel action
    @IBAction func actionMenu(_ sender: Any) {
       present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    //MARK:- Action Notification
    @IBAction func actionNotification(_ sender: Any) {
        
    }
    
    //MARK:- Action Job list
    @IBAction func actionJoblist(_ sender: Any){
        btnJobList.setTitleColor(.yellow, for: .normal)
        lblViewJob_Fav.backgroundColor = .yellow
         btnFavourts.setTitleColor(.white, for: .normal)
         btnMyJob.setTitleColor(.white, for: .normal)
        btnToday_viewCandidate.setTitle("Today", for: .normal)
        btnToday_viewCandidate.setTitleColor(.yellow, for: .normal)
        btnAll_SaveCandidate.setTitleColor(.white, for: .normal)
        lblViewJob_Fav.frame.origin.x = btnToday_viewCandidate.frame.origin.x
        btnAll_SaveCandidate.setTitle("All", for: .normal)
        viewJob_Favrates.isHidden = false
        viewMyJobs.isHidden = true
        checkStatus = ""
        myJobStatus = ""
        boolVal = false
        tblView.reloadData()
    }
    
    //MARK:- Action Favourties
    @IBAction func actionFavourt(_ sender: Any){
        btnFavourts.setTitleColor(.yellow, for: .normal)
        btnJobList.setTitleColor(.white, for: .normal)
        btnMyJob.setTitleColor(.white, for: .normal)
        lblViewJob_Fav.backgroundColor = .yellow
        lblViewJob_Fav.frame.origin.x = btnToday_viewCandidate.frame.origin.x
        btnToday_viewCandidate.setTitle("Viewed Jobs", for: .normal)
        btnAll_SaveCandidate.setTitle("Saved Jobs", for: .normal)
        viewJob_Favrates.isHidden = false
        viewMyJobs.isHidden = true
        checkStatus = ""
        myJobStatus = ""
        boolVal = false
        tblView.reloadData()
    }
    
    //MARK:- Action My Jobs
    @IBAction func actionMyJobs(_ sender: Any){
        btnMyJob.setTitleColor(.yellow, for: .normal)
        btnJobList.setTitleColor(.white, for: .normal)
        btnFavourts.setTitleColor(.white, for: .normal)
        lblViewJob_Fav.backgroundColor = .yellow
        lblViewJob_Fav.frame.origin.x = btnMyJob.frame.origin.x+btnMyJob.frame.size.width
        viewMyJobs.isHidden = false
        viewJob_Favrates.isHidden = true
        checkStatus = "1"
        lblMyJobs.frame.origin.x = btnApplied.frame.origin.x
        myJobStatus = "2"
        aryMyJobs = ["Leading Marketing Manager"]
        boolVal = false
        tblView.reloadData()
    }
    
    //MARK:- view JobList & Favourites Btn Today and View candidates Actions
    @IBAction func actionToday_ViewCandidates(_ sender: Any){
        
        btnToday_viewCandidate.setTitleColor(.yellow, for: .normal)
        btnAll_SaveCandidate.setTitleColor(.white, for: .normal)
        lblViewJob_Fav.frame.origin.x = btnToday_viewCandidate.frame.origin.x
        boolVal = false
        myJobStatus = ""
        tblView.reloadData()
    }
    
    //MARK:- Action All and Save candidates
    @IBAction func actionAll_SavedCandidates(_ sender: Any){
        btnToday_viewCandidate.setTitleColor(.yellow, for: .normal)
        btnAll_SaveCandidate.setTitleColor(.white, for: .normal)
        lblViewJob_Fav.frame.origin.x = btnAll_SaveCandidate.frame.origin.x
        myJobStatus = ""
        if btnAll_SaveCandidate.currentTitle == "Saved Jobs"{
            boolVal = true
        }
        tblView.reloadData()
    }
    
    //MARK:- view My Jobs Btn Applied Actions
    @IBAction func actionApplied(_ sender: Any){
        myJobStatus = "2"
        btnApplied.setTitleColor(.yellow, for: .normal)
        lblMyJobs.frame.origin.x = btnApplied.frame.origin.x
        aryMyJobs = ["Leading Marketing Manager"]
        tblView.reloadData()
    }
    
    //MARK:- Action Shortlisted
    @IBAction func actionShorlisted(_ sender: Any){
        myJobStatus = "3"
        lblMyJobs.frame.origin.x = btnShorlist.frame.origin.x
        btnShorlist.setTitleColor(.yellow, for: .normal)
        aryMyJobs = ["Leading Marketing Manager"]
        tblView.reloadData()
    }
    
    //MARK:- Action Rejected
    @IBAction func actionRejected(_ sender: Any){
        myJobStatus = "4"
        lblMyJobs.frame.origin.x = btnRejected.frame.origin.x
        btnRejected.setTitleColor(.yellow, for: .normal)
        aryMyJobs = ["Leading Marketing Manager"]
        tblView.reloadData()
    }
    
    //MARK:- Tablview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if checkStatus == "1" {
            return aryMyJobs.count
        } else {
            return aryJobList.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "JobsVcCell", for: indexPath) as! JobsVcCell
        
        cell.viewStatusClr.isHidden = true
        cell.btnStatus.isHidden = true
        
        if checkStatus == "1" {
            
            if myJobStatus == "2" {
                cell.lblJobType.text = aryMyJobs.object(at: indexPath.row) as? String
                cell.viewStatusClr.isHidden = false
                cell.btnStatus.isHidden = false
                cell.lblHrs.isHidden = true
                cell.btnStatus.backgroundColor = clrApplied
                cell.viewStatusClr.backgroundColor = clrApplied
                cell.btnStatus.setTitle("Applied", for: .normal)
            } else if myJobStatus == "3" {
                cell.lblJobType.text = aryMyJobs.object(at: indexPath.row) as? String
                cell.viewStatusClr.isHidden = false
                cell.btnStatus.isHidden = false
                cell.lblHrs.isHidden = true
                cell.btnStatus.backgroundColor = .green
                cell.viewStatusClr.backgroundColor = .green
                cell.btnStatus.setTitle("Shortlisted", for: .normal)
            } else if myJobStatus == "4" {
                cell.lblJobType.text = aryMyJobs.object(at: indexPath.row) as? String
                cell.viewStatusClr.isHidden = false
                cell.btnStatus.isHidden = false
                cell.lblHrs.isHidden = true
                cell.btnStatus.backgroundColor = .red
                cell.viewStatusClr.backgroundColor = .red
                cell.btnStatus.setTitle("Rejected", for: .normal)
            }
            
        } else {
            if boolVal == true {
                cell.lblJobType.text = aryJobList.object(at: indexPath.row) as? String
                cell.btnStar.setImage(UIImage(named: "blue_star_small"), for: .normal)

                
                cell.lblHrs.isHidden = false
            } else {
                cell.lblJobType.text = aryJobList.object(at: indexPath.row) as? String
                cell.btnStar.setImage(UIImage(named: "gray_star"), for: .normal)
                cell.lblHrs.isHidden = false
            }
            
        }
        return cell
    }
    
    
    
}



