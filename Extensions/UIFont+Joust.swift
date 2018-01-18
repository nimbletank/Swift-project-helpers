//
//  UIFont+Joust.swift
//  Joust
//
//  Created by Georgios Erakleous on 27/06/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//
// Example of a UIFont extension to be used when we need to create custom fonts

import UIKit

extension UIFont {
	
	// MARK: Porter Medium
	open class var porterMediumSize14: UIFont {
		get {
			return UIFont(name: "Porter-Medium", size: 14) ?? systemFont(ofSize: 14)
		}
	}
	
}
