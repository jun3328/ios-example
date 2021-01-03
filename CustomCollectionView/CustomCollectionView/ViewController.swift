//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by lee on 2021/02/03.
//

import UIKit

final class ViewController: UIViewController {
    
    private var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","U","Z"]
    
    private let colorSet: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue, .systemPurple]
    
    private lazy var collectionView = { () -> UICollectionView in
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        // layout.scrollDirection = .horizontal
        
        let itemsPerRow: CGFloat = 3
        let widthPadding = layout.sectionInset.left * (itemsPerRow + 1)
        
        let itemsPerColumn: CGFloat = 4
        let heightPadding = layout.sectionInset.top * (itemsPerColumn + 1)
        
        let cellWidth = (self.view.frame.width - widthPadding) / itemsPerRow
        let cellHeight = (self.view.frame.height - heightPadding) / itemsPerColumn
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.dataSource = self
        view.delegate = self
        view.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CustomCollectionViewCell.self))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CustomCollectionView"
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(alphabet[indexPath.row]) Selected")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alphabet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCollectionViewCell.self), for: indexPath) as! CustomCollectionViewCell
        
        cell.backgroundColor = colorSet[indexPath.row / colorSet.count]
        cell.labelText = alphabet[indexPath.row]
        return cell
    }
}

#if DEBUG
import SwiftUI
@available(iOS 13.0, *)
struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { /* no-op */ }

    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {

    static var previews: some View {
        ViewControllerRepresentable().previewDisplayName("아이폰 12")
    }
}
#endif
