//
//  ViewController.swift
//  CustomTabBar
//
//  Created by lee on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    var isHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "첫 번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        // 콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let tabBar = self.tabBarController?.tabBar {
            isHidden = !isHidden
            UIView.animate(withDuration: TimeInterval(0.15)) {
                tabBar.alpha = (self.isHidden == false) ? 1 : 0
            }
        }
        
    }

}

