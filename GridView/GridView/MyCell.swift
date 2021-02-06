//
//  MyCell.swift
//  GridView
//
//  Created by lee on 2021/02/06.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var name: String = "" {
        didSet {
            label.text = name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    
    func configure() {
        self.backgroundColor = .systemYellow
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
