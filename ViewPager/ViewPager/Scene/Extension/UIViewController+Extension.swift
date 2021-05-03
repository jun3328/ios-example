//
//  UIViewController+Extension.swift
//  ViewPager
//
//  Created by lee on 2021/05/03.
//

import UIKit

extension UIViewController {

    func add(child viewController : UIViewController){
        self.addChild(viewController)
        self.view.addSubview(viewController.view)

        viewController.view.frame = self.view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func remove(child viewController : UIViewController){

        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}
