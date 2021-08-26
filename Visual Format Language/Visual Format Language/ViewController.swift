//
//  ViewController.swift
//  Visual Format Language
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
        addConstraintsWithVFL()
    }
    
    private func addElementsToStackView() {
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(twitterButton)
        stackView.addArrangedSubview(googleButton)
    }

    func addConstraintsWithVFL() {
        let vflViews = [
            "login": loginButton,
            "or": orLabel,
            "facebook": facebookButton,
            "twitter": twitterButton,
            "google": googleButton,
            "stack": stackView
        ]
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-20-[login]-20-|",
                options: [],
                metrics: [:],
                views: vflViews)
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-<=350-[login(height)]-10-[or(20)]-10-[stack(50)]-<=200-|",
                options: [],
                metrics: ["height": 50],
                views: vflViews)
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-150-[or]-150-|",
                options: [],
                metrics: [:],
                views: vflViews)
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-100-[stack]-100-|",
                options: [],
                metrics: [:],
                views: vflViews)
        )
        
        stackView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-10-[facebook(50)]-10-[twitter(50)]-10-[google(50)]-10-|",
                options: [],
                metrics: [:],
                views: vflViews)
        )
    }
    
}

