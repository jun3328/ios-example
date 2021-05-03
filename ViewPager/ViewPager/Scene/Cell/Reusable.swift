//
//  Reusable.swift
//  ViewPager
//
//  Created by lee on 2021/05/03.
//

import Foundation

protocol Reusable {
    static var identifer: String { get }
}

extension Reusable {
    static var identifer: String {
        return String(describing: Self.self)
    }
}
