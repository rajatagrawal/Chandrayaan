//
//  ViewController.swift
//  Chandrayaan
//
//  Created by Rajat Agrawal on 9/15/19.
//  Copyright © 2019 Rajat Agrawal. All rights reserved.
//

import UIKit
import LunarPresentationKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    let button = UIButton(type: .system)
    var modalStylePresentationController : LNModalStylePresentationController?
    let chandrayaanTransitioningDelegate = LNTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.window?.layer.speed = 0.1
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        } else {
            // Fallback on earlier versions
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(settingsButtonPressed(sender:)), for: .touchUpInside)
    }
    
    @objc func settingsButtonPressed(sender : UIButton) {
        let vc = ChandrayaanViewController()
        let nav = UINavigationController(rootViewController: ChandrayaanViewController())
//        nav.view.layer.masksToBounds = true
//        nav.delegate = self
        nav.transitioningDelegate = chandrayaanTransitioningDelegate
        nav.modalPresentationStyle = .custom
        
        vc.transitioningDelegate = chandrayaanTransitioningDelegate
        vc.modalPresentationStyle = .custom
        
//        modalStylePresentationController = LNModalStylePresentationController(presentedViewController: vc, presenting: self)
        modalStylePresentationController = LNModalStylePresentationController(presentedViewController: nav, presenting: self)
        
        chandrayaanTransitioningDelegate.presentationController = modalStylePresentationController
        chandrayaanTransitioningDelegate.needsInteractivePresentation = false
        chandrayaanTransitioningDelegate.needsInteractiveDismissal = false
        
        present(nav, animated: true, completion: nil)
//        present(vc, animated: true, completion: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        Swift.print("calling for navigation controller")
        return LNModalAnimator()
    }


}

