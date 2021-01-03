//
//  CSButton.swift
//  CustomButton
//
//  Created by lee on 2021/01/12.
//

import UIKit

enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    
    var style: CSButtonType = .rect {
        didSet {
            switch style {
                case .rect :
                    self.backgroundColor = .black
                    self.layer.borderWidth = 2
                    self.layer.borderColor = UIColor.black.cgColor
                    self.layer.cornerRadius = 0
                    self.setTitleColor(.white, for: .normal)
                    self.setTitle("Rect Button", for: .normal)
                    
                case .circle :
                    self.backgroundColor = .red
                    self.layer.borderWidth = 2
                    self.layer.borderColor = UIColor.blue.cgColor
                    self.layer.cornerRadius = 50
                    self.setTitle("Circle Button", for: .normal)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("스토리보드로 생성된 버튼", for: .normal)
        self.sizeToFit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("코드로 생성된 버튼", for: .normal)
    }
    
    init() {
        super.init(frame: CGRect.zero )
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
            case .rect :
                self.backgroundColor = .black
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.cornerRadius = 0
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
                
            case .circle :
                self.backgroundColor = .red
                self.layer.borderWidth = 2
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.cornerRadius = 50
                self.setTitle("Circle Button", for: .normal)
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
        
    }
}
