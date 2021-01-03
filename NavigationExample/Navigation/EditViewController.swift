//
//  EditViewController.swift
//  Navigation
//
//  Created by lee on 2020/09/10.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

protocol EditDelegate {
    
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    func didImageOnOf(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    
    var textMessage: String = ""
    
    var isOn = false
    
    var delegate: EditDelegate?
    
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var lblWay: UILabel!
    
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOf(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageToggle(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
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
