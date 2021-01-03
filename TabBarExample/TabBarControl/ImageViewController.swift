//
//  ImageViewController.swift
//  TabBarControl
//
//  Created by lee on 2020/09/14.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var btnResize: UIButton!
    
    private var isZoom = false
    
    private let lampOn = UIImage(named: "lamp_on.png")
    
    private let lampOff = UIImage(named: "lamp_off.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = lampOn
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        if isZoom {
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func toggleImage(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = lampOn
        } else {
            imageView.image = lampOff
        }
    }
}
