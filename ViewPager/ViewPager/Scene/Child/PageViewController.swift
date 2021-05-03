//
//  PageViewController.swift
//  ViewPager
//
//  Created by lee on 2021/04/14.
//

import UIKit

final class PageViewController: UIPageViewController {

    var currentIndex = 0
    
    var items: [UIViewController] = []
    
    convenience init(items: [UIViewController]) {
        self.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.items = items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.setViewControllers([items[0]], direction: .forward, animated: true, completion: nil)
    }

}
extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed, let viewControllerIndex = items.firstIndex(of: pageViewController.viewControllers!.first!) else { return }

        self.currentIndex = viewControllerIndex
    }
}

extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = items.firstIndex(of: viewController) else { return nil }

        let previousIndex = currentIndex - 1

        guard previousIndex >= 0 else { return nil }

        // 처음에서 옆으로해서 마지막 colorVC.last
        return items[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = items.firstIndex(of: viewController) else { return nil }

        let nextIndex = currentIndex + 1

        guard nextIndex < items.count else { return nil }

        // 마지막에서 옆으로해서 처음 colorVC.first
        return items[nextIndex]
    }
}
//extension PageViewController: UIPageViewControllerDataSource {
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//}
