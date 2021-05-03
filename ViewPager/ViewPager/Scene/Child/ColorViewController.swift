//
//  ColorViewController.swift
//  ViewPager
//
//  Created by lee on 2021/04/14.
//

import UIKit

final class ColorViewController: UIViewController {
    
    static func newInstance(color: UIColor) -> ColorViewController {
        let vc = ColorViewController()
        vc.view.backgroundColor = color
        return vc
    }
}
