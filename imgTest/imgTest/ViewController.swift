//
//  ViewController.swift
//  imgTest
//
//  Created by Steew on 20.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    private let firstWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = .blue

        return webView
    }()

    private let secondWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.backgroundColor = .yellow

        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebViews()
        fetchData()
    }

    private func setupWebViews() {
        view.addSubview(firstWebView)
        view.addSubview(secondWebView)

        NSLayoutConstraint.activate([
            firstWebView.topAnchor.constraint(equalTo: view.topAnchor),
            firstWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstWebView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            secondWebView.topAnchor.constraint(equalTo: view.centerYAnchor),
            secondWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchData() {
        let firstURL = URL(string: "https://google.com")
        let secondURL = URL(string: "https://yahoo.com")

        if let url = firstURL {
            firstWebView.load(URLRequest(url: url))
        }

        if let url = secondURL {
            secondWebView.load(URLRequest(url: url))
        }
    }
}

