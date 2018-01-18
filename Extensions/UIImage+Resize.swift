//
//  UIImage+Resize.swift
//
//  Created by Georgios Erakleous on 15/06/2017.
//  Copyright © 2017 Georgios Erakleous. All rights reserved.
//

import UIKit

extension UIImage {
	
	enum JPEGQuality: CGFloat {
		case lowest = 0
		case low 	= 0.25
		case medium = 0.5
		case high 	= 0.75
		case highest = 1
	}
	
	// return the JPEG data from a given image
	func toJPEG(withQuality quality: JPEGQuality) -> Data? {
		return UIImageJPEGRepresentation(self, quality.rawValue)
	}
	
	// Resize methods below adapted from https://stackoverflow.com/a/29138120
	// resize an image based on the given percentage - max value is 1.0 and minimum is 0.0
	func resize(withPercentage percentage: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, 0.0)
		draw(in: CGRect(origin: .zero, size: canvasSize))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage
	}
	
	// resize an image to the given width
	func resize(toWidth width: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: width, height: CGFloat(ceil(width / size.width * size.height)))
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, 0.0)
		draw(in: CGRect(origin: .zero, size: canvasSize))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage
	}
	
	// Returns an image that fills in newSize
	func resizedImage(newSize: CGSize) -> UIImage? {
		guard self.size != newSize else {
			return self
		}
		
		UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
		draw(in: CGRect(x: 0.0, y: 0.0, width: newSize.width, height: newSize.height))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage
	}
}
