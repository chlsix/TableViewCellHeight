//
//  MyTableViewCell.swift
//  TableViewCellHeight
//
//  Created by 陈磊 on 16/1/13.
//  Copyright © 2016年 ShenSu. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLable: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
