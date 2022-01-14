//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit
import QuartzCore

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var typeBadge: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        makeCircleBorder()
        
    }
    
    func makeCircleBorder() {
        let imageLayer: CALayer? = thumbnail.layer
        imageLayer?.cornerRadius = thumbnail.frame.size.width/2
        imageLayer?.borderWidth = 1
        imageLayer?.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
