//
//  ViewController.swift
//  ImageZoom
//
//  Created by lee on 2021/02/02.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemBlue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "blahblah"
        label.backgroundColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel2: UILabel = {
        let label = UILabel()
        label.text = "blahblah"
        label.backgroundColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contentStackView.addArrangedSubview(nameLabel)
    
        contentStackView.addArrangedSubview(nameLabel2)
        
        self.view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
#if DEBUG
import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { /* no-op */ }

    @available(iOS 13.0, *)
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
