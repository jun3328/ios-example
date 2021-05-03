//
//  TabCell.swift
//  ViewPager
//
//  Created by lee on 2021/04/14.
//

import UIKit

final class TabItemCollectionViewCell: UICollectionViewCell, Reusable {
    
    static func fittingSize(name: String, availableHeight: CGFloat = 20) -> CGSize {
        let cell = TabItemCollectionViewCell()
        cell.bind(name: name)
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
        return cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    private let title: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            bind(isSelected: isSelected)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        makeConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        unbind()
        super.prepareForReuse()
    }

    private func configure() {
        self.layer.cornerRadius = 6
        self.backgroundColor = .black
        self.contentView.addSubview(title)
    }
    
    private func makeConstraint() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func bind(name: String) {
        self.title.text = name
    }
    
    func bind(isSelected: Bool) {
        self.title.textColor = isSelected ? .red : .white
    }
    
    func unbind() {
        self.title.text = nil
    }
}
