//
//  DateViewController.swift
//  TabBarControl
//
//  Created by lee on 2020/09/14.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet var currentTime: UILabel!
    
    @IBOutlet var pickerTime: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    private var count = 0
    
    private let interval = 1.0
    
    private let timeSelector: Selector = #selector(DateViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currentTime.text = "현재시간 \(formatter.string(from: date as Date))"
    }
    
    
    @IBAction func chnageDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        pickerTime.text = "선택시간 \(formatter.string(from: datePickerView.date))"
    }
}
