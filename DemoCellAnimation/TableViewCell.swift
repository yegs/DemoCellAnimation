//
//  TableViewCell.swift
//  DemoCellAnimation
//
//  Created by yeguoshuai on 16/8/4.
//  Copyright © 2016年 AK. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstaint: NSLayoutConstraint!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgView.clipsToBounds = true
        self.contentView.clipsToBounds = true
        self.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
