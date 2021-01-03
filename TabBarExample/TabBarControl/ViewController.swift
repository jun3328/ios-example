//
//  ViewController.swift
//  TabBarControl
//
//  Created by lee on 2020/09/14.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDate(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

