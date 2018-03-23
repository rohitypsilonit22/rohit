//
//  SettingsViewTableCell.swift
//  Email
//
//  Created by Xiao Lin on 3/7/18.
//  Copyright © 2018 Xiao Lin. All rights reserved.
//

import UIKit

class SettingsViewTableCell: UITableViewCell{
    @IBOutlet weak var img_Icon: UIImageView!
    @IBOutlet weak var lbl_Title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }

    func setSettingData(SettingData : NSDictionary){
        lbl_Title.text = SettingData.value(forKey: "name") as? String
        img_Icon.image = UIImage(named:(SettingData.value(forKey: "Image") as! String))
    }
    
    func setSidePanelData(SidePanelData : NSDictionary){
        lbl_Title.text = SidePanelData.value(forKey: "name") as? String
        img_Icon.image = UIImage(named:(SidePanelData.value(forKey: "Image") as! String))
    }
    
}
