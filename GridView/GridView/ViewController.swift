//
//  ViewController.swift
//  GridView
//
//  Created by lee on 2021/02/06.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    private let itemsPerRow: CGFloat = 3

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.register(MyCell.self, forCellWithReuseIdentifier: String(describing: MyCell.self))
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let item = [
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "구트",
        "구찌",
        "그랑블루",
        "귓볼"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Grid"
        self.view.addSubview(collectionView)
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(item[indexPath.item])
        print(item[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCell.self), for: indexPath) as! MyCell
        cell.name = item[indexPath.item]
        
        return cell
    }
}
