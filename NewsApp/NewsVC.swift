//
//  NewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 9/1/2565 BE.
//

import UIKit

class NewsVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = news?.title
        bodyTextView.text = news?.body
    }
    
    @IBAction func forMoreDetailButtonDidClick(_ sender: Any) {
//        let url = URL(string: urlSting.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!),
        guard let url = news?.url, UIApplication.shared.canOpenURL(url) else { return }

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
