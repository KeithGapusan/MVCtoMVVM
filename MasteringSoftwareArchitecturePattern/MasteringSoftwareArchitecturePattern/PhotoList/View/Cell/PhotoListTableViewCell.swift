//
//  PhotoListTableViewCellTableViewCell.swift
//  MVVMPlayground
//
//  Created by Keith Gapusan on 19/07/2018.
//  Copyright © 2018 ST.Huang. All rights reserved.
//

import UIKit

class PhotoListTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descContainerHeightConstraint: NSLayoutConstraint!
}
