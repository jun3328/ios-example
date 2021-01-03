//
//  ThirdViewController.swift
//  CustomTabBar
//
//  Created by lee on 2021/01/11.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "세 번째 탭"
        title.textColor = .blue
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        // 콘텐츠 내용에 맞게 레이블 크기 변경
        title.sizeToFit()
        
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
        // Do any additional setup after loading the view.
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
