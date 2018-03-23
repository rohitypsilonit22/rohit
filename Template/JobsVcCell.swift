//
//  JobsVcCell.swift
//  Template
//
//  Created by admin on 3/22/18.
//  Copyright © 2018 khushboo. All rights reserved.
//

import UIKit

class JobsVcCell: UITableViewCell {
    @IBOutlet var lblJobType: UILabel!
    @IBOutlet var lblGroupName: UILabel!
    @IBOutlet var lblFulltime_Rupes: UILabel!
    @IBOutlet var lblHrs: UILabel!
    @IBOutlet var btnStatus: UIButton!
    @IBOutlet var viewStatusClr: UIView!
    
    @IBOutlet weak var btnStar: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnStatus.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
