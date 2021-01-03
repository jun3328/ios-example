//
//  ViewController.swift
//  CustomAlert
//
//  Created by lee on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        defaultAlertBtn.center.x = self.view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
        self.view.addSubview(defaultAlertBtn)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        let v = UIViewController()
        v.view.backgroundColor = .red
        
        alert.setValue(v, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }

}

