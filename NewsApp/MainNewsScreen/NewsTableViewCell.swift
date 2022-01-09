//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var typeBadge: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
