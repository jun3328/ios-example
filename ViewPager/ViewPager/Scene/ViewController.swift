//
//  ViewController.swift
//  ViewPager
//
//  Created by lee on 2021/04/14.
//

import UIKit

final class ViewController: UIViewController {

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

    private let viewPager: PageViewController = {
        let vc = PageViewController(items:[
            ColorViewController.newInstance(color: .red),
            ColorViewController.newInstance(color: .green),
            ColorViewController.newInstance(color: .blue),
            ColorViewController.newInstance(color: .yellow)
        ])
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
        self.view.addSubview(viewPager.view)
        self.view.backgroundColor = .white
        
        self.tabLayout.delegate = self
        self.tabLayout.dataSource = self
        self.tabLayout.selectItem(at: .init(row: 0, section: 0), animated: false, scrollPosition: .bottom)

        // Set Child View Controller
        self.addChild(viewPager)
        self.viewPager.didMove(toParent: self)
    }

    private func makeConstraint() {
        NSLayoutConstraint.activate([
            self.tabLayout.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tabLayout.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tabLayout.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tabLayout.heightAnchor.constraint(equalToConstant: Dimens.tabHeight),
            
            self.viewPager.view.topAnchor.constraint(equalTo: self.tabLayout.bottomAnchor),
            self.viewPager.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.viewPager.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.viewPager.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = viewPager.items[indexPath.row]
        viewPager.setViewControllers([vc], direction: .forward, animated: false)
        // direction: pageViewControler.currentIndex < indexPath.row ? .forward : .reverse,
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
