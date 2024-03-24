//
//  ViewController.swift
//  SimpleUIKitProject
//
//  Created by Siroratt Suntronsuk on 17/3/2567 BE.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(webView)
        webView.navigationDelegate = self
        
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }

//    override func web

}

