//
//  String+Localizable.swift
//  HeyGreenGo
//
//  Created by Georgios Erakleous on 09/05/2017.
//  Copyright © 2017 Nimbletank. All rights reserved.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
