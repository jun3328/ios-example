//
//  ViewController.swift
//  Navigation
//
//  Created by lee on 2020/09/10.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imgOn
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        editViewController.textMessage = txMessage.text!
        editViewController.delegate = self
        editViewController.isOn = isOn
        
        switch segue.identifier {
        case "editButton":
            editViewController.textWayValue = "segue : use button"
            break
        case "editBarButton":
            editViewController.textWayValue = "segue : use bar button"
            break
        default:
            break
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOf(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imgOn
            self.isOn = true
        } else {
            imageView.image = imgOff
            self.isOn = false
        }
    }
}
