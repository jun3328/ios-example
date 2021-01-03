//
//  CSStepper.swift
//  CustomStepper
//
//  Created by lee on 2021/01/12.
//

import UIKit
@IBDesignable
class CSStepper: UIControl {

    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    
    @IBInspectable public var stepValue: Int = 1
    
    @IBInspectable public var minValue: Int = -10
    
    @IBInspectable public var maxValue: Int = 10
    
    @IBInspectable
    public var value: Int = 0 {
        didSet {
            print("before \(oldValue), afrer \(value)")
            self.centerLabel.text = String(value)
            
            // 이 클래스를 사용하는 개체들에게 valueChanged 이벤트 신호를 보내준다.
            self.sendActions(for: .valueChanged)
        }
    }
    
    @IBInspectable
    public var leftTitle: String = "🔽" {
        didSet {
            print("before \(oldValue), afrer \(leftTitle)")
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightTitle: String = "🔼" {
        didSet {
            print("before \(oldValue), afrer \(rightTitle)")
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerLabel.backgroundColor = bgColor
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        self.leftBtn.tag = -1
        self.leftBtn.setTitle(leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
        
        self.leftBtn.addTarget(self, action: #selector(valueChnage(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChnage(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnWidth = self.frame.height
        let lblWidth = self.frame.width - btnWidth * 2
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
    
    @objc public func valueChnage(_ sender: UIButton) {
        let sum = self.value + (sender.tag * stepValue)
        
        if sum > maxValue {
            return
        }
        
        if sum < minValue {
            return
        }
        
        self.value += (sender.tag * stepValue)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
