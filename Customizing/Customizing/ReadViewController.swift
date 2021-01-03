//
//  ReadViewController.swift
//  Customizing
//
//  Created by lee on 2021/01/06.
//

import UIKit

class ReadViewController: UIViewController {

    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let email = UILabel()
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        email.text = "전달받은 이메일: \(pEmail!)"
        view.addSubview(email)
        
        let update = UILabel()
        update.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        update.text = "업데이트 여부: \(pUpdate == true ? "업데이트 함" : "업데이트 안 함")"
        view.addSubview(update)
        
        let interval = UILabel()
        interval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        interval.text = "업데이트 주기: \(pInterval!) 분마다"
        view.addSubview(interval)
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
