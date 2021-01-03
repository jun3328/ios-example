//
//  ViewController.swift
//  WebViewExample
//
//  Created by lee on 2020/08/25.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var urlTextField: UITextField!
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        loadWebPage(url: "https://developer.apple.com")
    }

    @IBAction func goToUrl(_ sender: UIButton) {
        loadWebPage(url: urlTextField.text ?? "https://google.com")
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    func loadWebPage(url: String) -> Void {
        webView.load(URLRequest(url: URL(string: checkUrl(url))!))
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        if !strUrl.hasPrefix("https://") {
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
}

