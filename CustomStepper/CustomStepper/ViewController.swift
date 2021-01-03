//
//  ViewController.swift
//  CustomStepper
//
//  Created by lee on 2021/01/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stepper = CSStepper(frame: CGRect(x: 30, y: 100, width: 130, height: 30))
        
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        
        self.view.addSubview(stepper)
        // Do any additional setup after loading the view.
    }


    @objc func logging(_ sender: CSStepper) {
        NSLog("현재 스테퍼의 값은 \(sender.value) 입니다.")
    }
}

