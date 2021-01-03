//
//  DetailViewController.swift
//  MovieChart
//
//  Created by lee on 2020/12/10.
//

import UIKit
import WebKit

class DetailViewController : UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    var repository: GithubRepoVO!
    
    override func viewDidLoad() {
        NSLog("linkurl = \(repository.url!), title=\(repository.title!)")
        
        webView.navigationDelegate = self
        
        let navBar = self.navigationItem
        navBar.title = repository.title
        
        if let url = repository.url {
            
            if let urlObj = URL(string: url) {
                webView.load(URLRequest(url: urlObj))
            } else {
                // URL 형식이 잘못된 경우
                alert("잘못된 URL입니다.") {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        } else {
            // URL이 전달되지 않은 경우
            alert("필수 파라미터가 누락되었습니다.") {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        
        alert("상세페이지를 읽어오지 못했습니다.") {
            self.navigationController?.popViewController(animated: true)
        }
    }
}


extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
    }
}
