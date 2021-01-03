//
//  AddViewController.swift
//  TableViewExample
//
//  Created by lee on 2020/09/15.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func addItem(item: String, image: String)
}

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    var addDelegate: AddItemDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        addDelegate?.addItem(item: tfAddItem.text!, image: ["cart.png", "clock.png", "pencil.png"].randomElement()!)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
}
