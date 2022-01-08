//
//  DemoVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit

class DemoVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }
    
}
