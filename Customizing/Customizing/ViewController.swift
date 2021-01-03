//
//  ViewController.swift
//  Customizing
//
//  Created by lee on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    var num = 0
    
    var paramEmail: UITextField!
    
    var paramUpdate: UISwitch!
    
    var paramInterval: UIStepper!
    
    var textUpdate: UILabel!
    
    var textInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "커스터마이징"
        
        
        addLabel(text: "이메일", pointX: 30, pointY: 100)
        addLabel(text: "자동갱신", pointX: 30, pointY: 150)
        addLabel(text: "갱신주기", pointX: 30, pointY: 200)
        
        paramEmail = UITextField()
        paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        paramEmail.font = UIFont.systemFont(ofSize: 13)
        paramEmail.borderStyle = .roundedRect
        paramEmail.placeholder = "이메일 예) abcdefg@naver.com"
        paramEmail.autocapitalizationType = .none
        view.addSubview(paramEmail)
        
        paramUpdate = UISwitch()
        paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        paramUpdate.setOn(true, animated: true)
        view.addSubview(paramUpdate)
        paramUpdate.addTarget(self, action: #selector(presentUpdateValue), for: .valueChanged)
        
        paramInterval = UIStepper()
        paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        paramInterval.minimumValue = 0
        paramInterval.maximumValue = 100
        paramInterval.stepValue = 1
        paramInterval.value = 0
        view.addSubview(paramInterval)
        paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        textUpdate = UILabel()
        textUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        textUpdate.font = UIFont.systemFont(ofSize: 12)
        textUpdate.textColor = UIColor.red
        textUpdate.text = "갱신함"
        view.addSubview(textUpdate)
        
        textInterval = UILabel()
        textInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        textInterval.font = UIFont.systemFont(ofSize: 12)
        textInterval.textColor = UIColor.red
        textInterval.text = "0분마다"
        view.addSubview(textInterval)
        
        let submitButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        navigationItem.rightBarButtonItem = submitButton
    }
    
    private func addLabel(text: String, pointX: Int, pointY: Int) {
        let label = UILabel()
        label.frame = CGRect(x: pointX, y: pointY, width: 100, height: 30)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14)
        // 폰트 지정시
        // label.font = UIFont(name: "noto sans regular", size: 14)
        view.addSubview(label)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat((rgbValue & 0x0000FF) >> 0) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }

    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("클릭 되었습니다. \(num)", for: .normal)
            num += 1
        }
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        textUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        textInterval.text = "\(Int(sender.value))분 마다"
    }
    
    @objc func submit(_ sender: UIBarButtonItem) {
        //textInterval.text = "\(Int(sender.value))분 마다"
        let rvc = ReadViewController()
        rvc.pEmail = paramEmail.text
        rvc.pUpdate = paramUpdate.isOn
        rvc.pInterval = paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}
