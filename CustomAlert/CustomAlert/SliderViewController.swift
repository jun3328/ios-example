//
//  SliderViewController.swift
//  CustomAlert
//
//  Created by lee on 2021/01/12.
//

import UIKit

class SliderViewController: UIViewController {

    private let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 170, height: 30))
    
    //슬라이더 객체의 값을 읽어올 연산 프로퍼티
    var sliderValue: Float {
        return slider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0
        slider.maximumValue = 100
        
        self.view.addSubview(slider)
        self.preferredContentSize = CGSize(width: slider.frame.width, height: slider.frame.height + 10)
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
