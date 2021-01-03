//
//  CSLogButton.swift
//  Memo
//
//  Created by lee on 2021/01/12.
//

import UIKit

enum CSLogType: Int {
    case basic
    case title
    case tag
}

@IBDesignable
class CSLogButton: UIButton {
    
//    @IBInspectable
//    public var bgColor: UIColor = UIColor.lightGray {
//        didSet {
//            self.backgroundColor = bgColor
//        }
//    }
    
    public var logType: CSLogType = .basic
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = .white
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    @objc func logging(_ sender: UIButton) {
        switch logType {
            case .basic:
                NSLog("버튼이 클릭되었습니다.")
            case .title:
                let btnTitle = self.titleLabel?.text ?? "타이틀 없음"
                NSLog("\(btnTitle) 버튼이 클릭되었습니다.")
            case .tag:
                NSLog("\(sender.tag) 버튼이 클릭되었습니다.")
        }
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
