//
//  CollectionViewCell.swift
//  CompositionalCollectionView
//
//  Created by lee on 2021/02/03.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private lazy var container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
//        view.spacing = 20
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .red
        view.font = UIFont.systemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageName: String = "" {
        didSet {
            imageLabel.text = imageName
            imageView.image = UIImage(systemName: imageName)
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        addSubview(container)
        
        container.addArrangedSubview(imageView)
        container.addArrangedSubview(imageLabel)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
//        addSubview(imageView)
//        addSubview(imageLabel)
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 50),
//            imageView.heightAnchor.constraint(equalToConstant: 50),
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            imageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            imageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50)
//        ])
    }
}
#if DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct ViewRepresentable: UIViewRepresentable {
    typealias UIViewType = CollectionViewCell
    
    func makeUIView(context: Context) -> CollectionViewCell {
        return CollectionViewCell()
    }
    
    func updateUIView(_ uiView: CollectionViewCell, context: Context) {
        uiView.imageName = "tornado"
    }
}
@available(iOS 13.0, *)
struct ViewPreviews: PreviewProvider {

    static var previews: some View {
        ViewRepresentable().previewDisplayName("아이폰 12")
    }
}
#endif
