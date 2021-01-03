//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by lee on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTitleInput()
    }

    func initTitle() {
        let nTitle = UILabel(frame: CGRect(x:0, y:0, width:200, height:40))
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.textColor = .white
        nTitle.font = UIFont.systemFont(ofSize: 15)
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        self.navigationItem.titleView = nTitle
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitleNew() {
        // 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        // 상단 레이블
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = .red
        topTitle.text = "58개 숙소"
        // 하단 레이블
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        self.navigationItem.titleView = containerView
        
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    func initTitleInput() {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .URL
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        self.navigationItem.titleView = tf
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow-back"), style: .plain, target: self, action: nil)
        
        
        let rv = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 37))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rv)
        
        let cnt = UILabel(frame: CGRect(x: 10, y: 8, width: 20, height: 20))
        cnt.font = UIFont.systemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        cnt.layer.cornerRadius = 3
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        rv.addSubview(cnt)
        
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        rv.addSubview(more)

//        let v = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 37))
//        v.backgroundColor = .brown
//
//        let leftItem = UIBarButtonItem(customView: v)
//        self.navigationItem.leftBarButtonItem = leftItem
//
//        let v2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 37))
//        v2.backgroundColor = .red
//
//        let rightItem = UIBarButtonItem(customView: v2)
//        self.navigationItem.rightBarButtonItem = rightItem
    }
}

