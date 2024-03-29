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
    
    lazy var imagePicker: UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        return vc
        
        //add plist. ask for user permission - Privacy - Camera Usage Description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateDinosaur()
        // 5 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) { [weak self] in
            
            print("Ann ja")
            let mainNewsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNewsVC") as! MainNewsVC
            
            
//            option#1
//            let demoVC = UIViewController()
//            demoVC.view.backgroundColor = .red
//            demoVC.modalPresentationStyle = .fullScreen //.pageSheet or .fullScreen
//            self?.present(demoVC, animated: true, completion: nil)
            
            
            
//            option#2
            guard let self = self, let window = self.view.window else { return }
            window.rootViewController = mainNewsVC
//            window.rootViewController = self.imagePicker
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
    
    func animateDinosaur() {
        view.addSubview(dinosaurView)
        view.bringSubviewToFront(dinosaurView)
        dinosaurView.play()
    }
}


//lottie 4.4.1 new syntax

//lazy var dinosaurView: LottieAnimationView? = {
//    let animationView = LottieAnimationView()
//    let path = Bundle.main.path(forResource: "dino",
//                                    ofType: "json") ?? ""
//    if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
//        let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),
//        let jsonResult = jsonResult as? [String: Any],
//        let animation = try? LottieAnimation(dictionary: jsonResult) {
//        animationView.animation = animation
//        animationView.frame = view.bounds
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.5
//        return animationView
//    }
//    return nil
//}()

//func animateDinosaur() {
//    if let dinosaurView = dinosaurView {
//        view.addSubview(dinosaurView)
//        view.bringSubviewToFront(dinosaurView)
//        dinosaurView.play()
//    }
//    
//}
