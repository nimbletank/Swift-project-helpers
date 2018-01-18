//
//  UIViewController+ActivityIndicator.swift
//  Joust
//
//  Created by Georgios Erakleous on 13/07/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
	
	func showActivityIndicator(_ size: CGSize? = CGSize(width: 50.0, height: 50.0),
	                           message: String? = nil,
	                           messageFont: UIFont? = nil,
	                           type: NVActivityIndicatorType? = .ballClipRotateMultiple,
	                           color: UIColor? = UIColor.rgb0_254_203,
	                           padding: CGFloat? = nil,
	                           displayTimeThreshold: Int? = nil,
	                           minimumDisplayTime: Int? = nil,
	                           backgroundColor: UIColor? = nil,
	                           textColor: UIColor? = nil) {
		
		startAnimating(size, message: message, messageFont: messageFont, type: type, color: color, padding: padding, displayTimeThreshold: displayTimeThreshold, minimumDisplayTime: minimumDisplayTime, backgroundColor: backgroundColor, textColor: textColor)
	}
	
	func hideActivityIndicator() {
		stopAnimating()
	}
	
}
