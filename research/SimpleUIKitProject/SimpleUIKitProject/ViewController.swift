//
//  ViewController.swift
//  SimpleUIKitProject
//
//  Created by Siroratt Suntronsuk on 17/3/2567 BE.
//

import UIKit
import WebKit
import SwiftUI

class ViewController: UIViewController, WKNavigationDelegate {

    @IBAction func goToSwiftUIButton(_ sender: Any) {
        let vc = UIHostingController(rootView: LoginView())
        self.present(vc, animated: true, completion: nil)
    }
    
    
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

