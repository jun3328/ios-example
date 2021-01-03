//
//  ViewController.swift
//  ImageZoom
//
//  Created by lee on 2021/02/02.
//

import UIKit

final class ImageZoomViewController: UIViewController {
    
    private lazy var scrollView = { () -> UIScrollView in
        let view = UIScrollView()
        view.delegate = self
        view.zoomScale = 1.0
        view.minimumZoomScale = 1.0
        view.maximumZoomScale = 3.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView = { () -> UIImageView in
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "flutter")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ImageZoom"
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = .black
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("did zoom")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("did scroll")
    }
}


#if DEBUG
import SwiftUI

struct ImageZoomViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { /* no-op */ }
    
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        return ImageZoomViewController()
    }
}

struct ImageZoomViewController_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageZoomViewControllerRepresentable()
            .previewDisplayName("아이폰 12")
    }
}
#endif
