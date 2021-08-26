//
//  ViewController.swift
//  NSLayoutAnchor
//
//  Created by Steew on 24.08.2021.
//

import UIKit

class ViewController: UIViewController {

    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        
        return button
    }()
    
    let twitterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "twitter"), for: .normal)
        
        return button
    }()
    
    let googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        
        return button
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or"
        label.textAlignment = .center
        
        return label
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        view.addSubview(orLabel)
        view.addSubview(stackView)
        
        addElementsToStackView()
        setLoginButtonConstraints()
        setOrLabelConstraints()
        setStackViewConstraints()
    }
    
    private func addElementsToStackView() {
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(twitterButton)
        stackView.addArrangedSubview(googleButton)
    }

    private func setLoginButtonConstraints() {
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setOrLabelConstraints() {
        orLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
    }

    private func setStackViewConstraints() {
        stackView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 10).isActive = true
        setFacebookButtonConstraints()
        setTwitterButtonConstraints()
        setGoogleButtonConstraints()
    }
    
    private func setFacebookButtonConstraints() {
        facebookButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setTwitterButtonConstraints() {
        twitterButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setGoogleButtonConstraints() {
        googleButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

