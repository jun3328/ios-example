//
//  DetailViewController.swift
//  TableViewExample
//
//  Created by lee on 2020/09/15.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    
    @IBOutlet var lbItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbItem.text = receiveItem
        // Do any additional setup after loading the view.
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
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
