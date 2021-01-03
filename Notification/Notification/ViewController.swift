//
//  ViewController.swift
//  Notification
//
//  Created by lee on 2021/01/10.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet var msg: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: UIButton) {
        if #available(iOS 10, *) {
            // UserNotification
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        
                        // 알림 콘텐츠 객체
                        let nContent = UNMutableNotificationContent()
                        nContent.title = "미리 알림"
                        nContent.body = (self.msg.text)!
                        nContent.sound = UNNotificationSound.default
                        nContent.userInfo = ["name":"stark"]
                        // 알림 발송 조건객체
                        let time = self.datePicker.date.timeIntervalSinceNow
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        // 알림 요청 객체
                        let nRequest = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(nRequest) { (_) in
                            DispatchQueue.main.async {
                                let date = self.datePicker.date.addingTimeInterval(9 * 60 * 60)
                                let msg = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다."
                                let alert = UIAlertController(title: "알림 등록", message: msg, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "확인", style: .default))
                                self.present(alert, animated: false)
                            }
                        }
                    }
                    
                } else {
                    
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "알림 등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "확인", style: .default))
                        self.present(alert, animated: false)
                        return
                    }
                }
            }
        } else {
            // UILocalNotification
        }
        
    }

}

