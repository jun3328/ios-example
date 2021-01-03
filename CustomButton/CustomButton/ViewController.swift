//
//  ViewController.swift
//  CustomButton
//
//  Created by lee on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let btn = CSButton(frame: CGRect(x: 30, y: 50, width: 150, height: 30))
        self.view.addSubview(btn)
        
        let rectBtn = CSButton(type: .rect)
        rectBtn.frame = CGRect(x: 30, y: 200, width: 150, height: 30)
        self.view.addSubview(rectBtn)
        
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 200, width: 150, height: 30)
        
        self.view.addSubview(circleBtn)
    }

}

