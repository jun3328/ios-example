//
//  MapAlertViewController.swift
//  CustomAlert
//
//  Created by lee on 2021/01/11.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertBtn = UIButton(type: .system)
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        self.view.addSubview(alertBtn)
        
        let imageBtn = UIButton(type: .system)
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        self.view.addSubview(imageBtn)
        
        let sliderBtn = UIButton(type: .system)
        sliderBtn.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        sliderBtn.center.x = self.view.frame.width / 2
        sliderBtn.setTitle("Slider Alert", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        self.view.addSubview(sliderBtn)
        
        let listBtn = UIButton(type: .system)
        listBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        listBtn.center.x = self.view.frame.width / 2
        listBtn.setTitle("ListBtn Alert", for: .normal)
        listBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        self.view.addSubview(listBtn)
    }
    
    
    @IBAction func mapAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        let contentVC = MapKitViewController()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }

    @IBAction func imageAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "평점은 다음과 같습니다", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        let contentVC = ImageViewController()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        
        self.present(alert, animated: false)
    }
    
    @IBAction func sliderAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "평점을 입력해주세요", preferredStyle: .alert)
        
        let contentVC = SliderViewController()
        
        alert.setValue(contentVC, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            let value = contentVC.sliderValue
            print("슬라이더 값 \(value)")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alert, animated: false)
    }
    
    @IBAction func listAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "평점을 입력해주세요", preferredStyle: .alert)
        
        let contentVC = ListViewController()
        contentVC.delegate = self
        
        alert.setValue(contentVC, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(alert, animated: false)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        //self.dismiss(animated: false)
        print("선택된 행은 \(indexPath.row)")
    }
    

}
