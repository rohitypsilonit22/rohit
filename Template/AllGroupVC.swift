//
//  FamilyVC.swift
//  aoneteam
//
//  Created by khushboo on 3/5/18.
//  Copyright © 2018 khushboo baghel. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AllGroupVC: UIViewController,IndicatorInfoProvider{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Function Calling
        self.decorateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Custom Methods
    
    func decorateUI(){
        
    }
    
    // MARK: - PagerTabStripDataSource
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "All")
    }
}
