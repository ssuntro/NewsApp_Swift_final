//
//  LaunchVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit
import Lottie

class LaunchVC: UIViewController {
    lazy var dinosaurView: AnimationView = {
        let animationView = AnimationView()
        let path = Bundle.main.path(forResource: "dino",
                                        ofType: "json") ?? ""
        animationView.animation = Animation.filepath(path)
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        return animationView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        animateDinosaue()
        // 5 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            
            print("Ann ja")
            //present MainNewVC
            let demoVC = UIViewController()
            demoVC.view.backgroundColor = .red
//            option#1
//            demoVC.modalPresentationStyle = .fullScreen //.pageSheet or .fullScreen
//            self?.present(demoVC, animated: true, completion: nil)
            
//            option#2
            guard let window = self.view.window else {
                return
            }
            window.rootViewController = demoVC
            window.makeKeyAndVisible()
            UIView.transition(with: window,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: nil,
                                  completion: nil)
            
        }
    }

    deinit {
        print("LaunchVC deinit")
    }
    func animateDinosaue() {
        view.addSubview(dinosaurView)
        view.bringSubviewToFront(dinosaurView)
        dinosaurView.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
