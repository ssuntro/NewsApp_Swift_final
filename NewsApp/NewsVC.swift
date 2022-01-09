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

        openBrowser()
//        jumpToInstagram()
//        jumpToStore()
    }
    
    @IBAction func removeButtonDidClick(_ sender: Any) {
        self.dismiss(animated: true) {
            print("removeButtonDidClick")
        }
    }
    deinit {
        print("NewsVC is deinited.")
    }
}

//MARK: - URL functionality
extension NewsVC {
    func openBrowser() {
 //       let url = URL(string: urlSting.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
        
        guard let url = news?.url, UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
//    func jumpToInstagram() {
//        let appURL = URL(string: "instagram://user?username=tastyjapan")!
//        if UIApplication.shared.canOpenURL(appURL) {
//            UIApplication.shared.open(appURL)
//        }
//    }
    
//    func jumpToStore() {
//        if let url = URL(string: "itms-apps://apple.com/app/id389801252") {
//            UIApplication.shared.open(url)
//        }
//    }
}
