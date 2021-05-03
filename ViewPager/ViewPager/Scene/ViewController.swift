//
//  ViewController.swift
//  ViewPager
//
//  Created by lee on 2021/04/14.
//

import UIKit

final class ViewController: UIViewController {

    private enum Dimens {
        static let tabContentInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        static let tabHeight: CGFloat = 60
        static let tabMinimumInteritemSpacing: CGFloat = 20
    }

    private let tabItem = ["브랜드", "상세옵션", "컬러/패턴", "가격"]

    private let tabLayout: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = Dimens.tabMinimumInteritemSpacing

        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentInset = Dimens.tabContentInset
        view.register(TabItemCollectionViewCell.self, forCellWithReuseIdentifier: TabItemCollectionViewCell.identifer)
        return view
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let viewPager: PageViewController = {
        let vc = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        vc.items = [
            ColorViewController.newInstance(color: .yellow),
            ColorViewController.newInstance(color: .green),
            ColorViewController.newInstance(color: .blue),
            ColorViewController.newInstance(color: .red),
        ]
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.makeConstraint()
    }
    
    private func configure() {
        self.view.addSubview(tabLayout)
        self.view.addSubview(containerView)
        self.view.backgroundColor = .white
        
        self.tabLayout.delegate = self
        self.tabLayout.dataSource = self
        self.tabLayout.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .bottom)

        self.addChild(viewPager)
        self.containerView.addSubview(viewPager.view)
        self.viewPager.didMove(toParent: self)
    }

    private func makeConstraint() {
        NSLayoutConstraint.activate([
            self.tabLayout.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tabLayout.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tabLayout.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tabLayout.heightAnchor.constraint(equalToConstant: Dimens.tabHeight),
            
            self.containerView.topAnchor.constraint(equalTo: self.tabLayout.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.viewPager.view.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.viewPager.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.viewPager.view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.viewPager.view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = viewPager.items[indexPath.row]

        viewPager.setViewControllers([vc], direction: .forward, animated: false)
        
//        pageViewControler.setViewControllers(
//            [vc],
//            direction: pageViewControler.currentIndex < indexPath.row ? .forward : .reverse,
//            animated: true,
//            completion: nil
//        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return TabItemCollectionViewCell.fittingSize(name: tabItem[indexPath.row])
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabItemCollectionViewCell.identifer, for: indexPath)
        
        if let cell = cell as? TabItemCollectionViewCell {
            cell.bind(name: tabItem[indexPath.row])
            cell.bind(isSelected: collectionView.indexPathsForSelectedItems?.first == indexPath)
        }
        return cell
    }
}
