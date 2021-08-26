//
//  ViewController.swift
//  #4 WebKit
//
//  Created by Steew on 25.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var secondWebView: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupActivityIndicator()
        loadAdress()
        loadLocalAdress()
    }
    
    private func setupActivityIndicator() {
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func setupWebView() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.bottomAnchor.constraint(equalTo: view.centerYAnchor)])
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    private func loadAdress() {
        if let url = URL(string: "https://www.yelp.com/search?find_desc=&find_loc=New%20York%2C%20NY") {
            webView.load(URLRequest(url: url))
        }
    }
    
    private func loadLocalAdress() {
        let url = Bundle.main.url(forResource: "TestPage", withExtension: "html")!
        secondWebView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        secondWebView.load(request)
    }

}

extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        activityIndicator.isHidden = true
//        activityIndicator.stopAnimating()
//    }
}

