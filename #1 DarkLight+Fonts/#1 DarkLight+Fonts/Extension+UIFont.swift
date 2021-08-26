//
//  Extension+UIFont.swift
//  #1 DarkLight+Fonts
//
//  Created by Steew on 23.08.2021.
//

import UIKit

extension UIFont {
    class func sansProRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: size)!
    }
    
    class func sansProBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-Bold", size: size)!
    }
    
    class func sansProSemiBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-SemiBold", size: size)!
    }
}

