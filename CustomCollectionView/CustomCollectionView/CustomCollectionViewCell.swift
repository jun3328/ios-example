//
//  CustomCollectionViewCell.swift
//  CustomCollectionView
//
//  Created by lee on 2021/02/03.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy var myLabel: UILabel = { () -> UILabel in
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var labelText: String = "" {
        didSet {
            myLabel.text = labelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
