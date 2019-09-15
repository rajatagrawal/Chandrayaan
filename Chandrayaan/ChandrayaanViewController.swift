//
//  ChandrayaanViewController.swift
//  Chandrayaan
//
//  Created by Rajat Agrawal on 9/15/19.
//  Copyright © 2019 Rajat Agrawal. All rights reserved.
//

import UIKit

class ChandrayaanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed(sender:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextPressed(sender:)))
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func donePressed(sender : UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextPressed(sender : UIBarButtonItem) {
        navigationController?.pushViewController(SecondChandraayanViewController(), animated: true)
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
