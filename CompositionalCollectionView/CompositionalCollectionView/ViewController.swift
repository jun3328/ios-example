//
//  ViewController.swift
//  CompositionalCollectionView
//
//  Created by lee on 2021/02/03.
//

import UIKit

final class ViewController: UIViewController {
    
    private let systemImageNameArray = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
    ]
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: createFlowLayout(itemsPerRow: 3, itemsPerColumn: 5))
//        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
        view.dataSource = self
        view.delegate = self
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Compositional"
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
extension ViewController {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            /* absolute 고정값 / estimated 추측 / fraction 퍼센트 */
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitem: item, count: 3)
            
            // 그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            // section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    
    private func createFlowLayout(itemsPerRow: CGFloat, itemsPerColumn: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let widthPadding = layout.sectionInset.left * (itemsPerRow + 1)
        let heightPadding = layout.sectionInset.top * (itemsPerColumn + 1)
        let cellWidth = (self.view.frame.width - widthPadding) / itemsPerRow
        let cellHeight = (self.view.frame.height - heightPadding) / itemsPerColumn
        
        //        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        //        layout.itemSize = CGSize(width: self.view.frame.width , height: self.view.frame.height / 3)
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .horizontal
        return layout
    }
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        systemImageNameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemGreen
        cell.imageName = systemImageNameArray[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(systemImageNameArray[indexPath.item])
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
        ViewControllerRepresentable()
            .previewDisplayName("아이폰 12")
    }
}
#endif
