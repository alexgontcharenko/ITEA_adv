//
//  ViewController.swift
//  #3 GCD
//
//  Created by Steew on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var images: [UIImageView]!
    @IBOutlet var activityIndicators: [UIActivityIndicatorView]!
    
    private let imgsUrl = [
        URL(string: "https://www.dutaindah-residence.com/assets/img/popular-places/popular-places-1.jpg")!,
        URL(string: "https://wallpaperbat.com/img/147401-cute-nature-wallpaper-top-free-cute-nature-background.jpg")!
    ]
    
    var data: [Data] = []
    
    let dispatchQueue = DispatchQueue(label: "", attributes: [.concurrent])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        activityIndicators.forEach({ indicator in
            indicator.startAnimating()
        })
        DispatchQueue.concurrentPerform(iterations: imgsUrl.count) { index in
            loadImages(index)
        }
    }
    
    func loadImages(_ index: Int) {
        let dispatchWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            if let data = try? Data(contentsOf: self.imgsUrl[index]) {
                self.data.append(data)
            }
            sleep(2)
        }

        dispatchWorkItem.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.activityIndicators[index].stopAnimating()
            self.activityIndicators[index].isHidden = true
            self.images[index].image = UIImage(data: self.data[index])
        }
        dispatchQueue.async(execute: dispatchWorkItem)
    }

    private func setupViews() {
        images[0].contentMode = .scaleToFill
        images[1].contentMode = .scaleToFill
        images[0].translatesAutoresizingMaskIntoConstraints = false
        images[1].translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            images[0].bottomAnchor.constraint(equalTo: view.centerYAnchor),
            images[1].topAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

