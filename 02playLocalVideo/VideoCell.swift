//
//  VideoCell.swift
//  02playLocalVideo
//
//  Created by sven on 16/12/18.
//  Copyright © 2016年 sven. All rights reserved.
//

import UIKit

struct video { // model
    let image : String
    let title : String
    let source : String
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
