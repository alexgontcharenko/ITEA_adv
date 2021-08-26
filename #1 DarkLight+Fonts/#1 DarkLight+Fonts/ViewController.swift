//
//  ViewController.swift
//  #1 DarkLight+Fonts
//
//  Created by Steew on 23.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var discoverLabel: UILabel!
    @IBOutlet weak var inclusionLabel: UILabel!
    @IBOutlet weak var firstImgLabel: UILabel!
    @IBOutlet weak var secondImgLabel: UILabel!
    @IBOutlet weak var thirdImgLabel: UILabel!
    @IBOutlet weak var fourthImgLabel: UILabel!
    
    @IBOutlet weak var discoverImg: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        setupLabels()
    }

    private func setupImages() {
        discoverImg.layer.cornerRadius = 10
        discoverImg.clipsToBounds = true
        
        firstImage.layer.cornerRadius = 10
        firstImage.clipsToBounds = true
        
        secondImage.layer.cornerRadius = 10
        secondImage.clipsToBounds = true
        
        thirdImage.layer.cornerRadius = 10
        thirdImage.clipsToBounds = true
        
        fourthImage.layer.cornerRadius = 10
        fourthImage.clipsToBounds = true
    }
    
    private func setupLabels() {
        discoverLabel.font = UIFont.sansProBold(ofSize: 30)
        inclusionLabel.font = UIFont.sansProSemiBold(ofSize: 20)
        firstImgLabel.font = UIFont.sansProRegular(ofSize: 17)
        secondImgLabel.font = UIFont.sansProRegular(ofSize: 17)
        secondImgLabel.adjustsFontSizeToFitWidth = true
        secondImgLabel.minimumScaleFactor = 0.5
        secondImgLabel.numberOfLines = 2
        thirdImgLabel.font = UIFont.sansProRegular(ofSize: 17)
        fourthImgLabel.font = UIFont.sansProRegular(ofSize: 17)
    }
    
}

