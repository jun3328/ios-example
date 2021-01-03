//
//  BaseViewController.swift
//  Movie
//
//  Created by lee on 2021/01/25.
//

import UIKit
import RxSwift

open class BaseViewController<VM>: UIViewController {
        
    open var disposeBag = DisposeBag()
    
    open var viewModel: VM?
    
    deinit {
        print("## deinit ##")
        disposeBag = DisposeBag()
    }
    
}
