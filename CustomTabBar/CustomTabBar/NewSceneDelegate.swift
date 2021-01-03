//
//  NewSceneDelegate.swift
//  CustomTabBar
//
//  Created by lee on 2021/01/11.
//

import UIKit

class NewSceneDelegate: UIResponder {
    
    var window: UIWindow?
    
    
    
}

extension NewSceneDelegate : UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = .white
        
        self.window?.rootViewController = tabBarController
        
        let view0 = ViewController()
        let view1 = SecondViewController()
        let view2 = ThirdViewController()
        
        tabBarController.setViewControllers([view0, view1, view2], animated: false)
        
        view0.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view1.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view2.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        
    }
}
