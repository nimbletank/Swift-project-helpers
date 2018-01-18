//
//  GEVersionMonitor.swift
//
//  Created by Georgios Erakleous on 18/09/2017.
//  Copyright © 2017 Georgios Erakleous. All rights reserved.
//

/*
---------------------
GEVersionMonitor 0.2
---------------------

Usage/Features:
---------------
- GEVersionMonitor.shared.isFirstLaunch				:	Checks to see if the user has launched the app for the first time (returns a Bool)
- GEVersionMonitor.shared.currentShortVersion		:	Returns app's current version (returns a String)
- GEVersionMonitor.shared.currentBuild				:	Returns app's current build (returns a String)
- GEVersionMonitor.shared.formattedVersion			:	Returns the app's version and build in the format: version (build) e.g. 1.0.0 (7) (returns a String)

Changes:
--------
v.0.1_18_09_2017:	initial logic (added logic for isFirstLaunch, cuurentVersion, CurentBuild, formattedVersion)
v.0.2_01_12_2017:	fixed issue with isFirstLaunch logic not updating UserDefaults


Future features:
----------------
	- previous version - GEVersionMonitor.shared.previousFormattedVersion	:	Returns the app's previous short version and build in the format: version (build) e.g. 1.0.0 (7) (returns a String)
	- track version history
	- compare versions/builds - useful to know when to show the force update screen

*/

import Foundation

private enum UserDefaultKeys: String {
	// launch
	case hasLaunchedBefore = "isFirstLaunch"
}

private enum VersionKeys: String {
	// app version and build numbers
	case shortVersion = "CFBundleShortVersionString"
	case buildNumber = "CFBundleVersion"
}

public struct GEVersionMonitor {
	// ----------------------------------------------------------------------------
	// MARK: - Properties
	// ----------------------------------------------------------------------------
	public static var shared = GEVersionMonitor()
	
	public var userDefaults = UserDefaults.standard
	public var bundle = Bundle.main
	
	private init() {
	
	}
}

// ----------------------------------------------------------------------------
// MARK: - Launch
// ----------------------------------------------------------------------------
extension GEVersionMonitor {

	// MARK: - Checks to see if the user has launched the app for the first time (uses UserDefaults)
	public var isFirstLaunch: Bool {
		mutating get {
			if hasLaunchedBefore {
				return false
			}
			
			// update defaults to set the value of hasLaunchedBefore to true
			hasLaunchedBefore = true
			return true
		}
	}
	
	private var hasLaunchedBefore: Bool {
		get {
			return userDefaults.value(forKey: UserDefaultKeys.hasLaunchedBefore.rawValue) as? Bool ?? false
		}
		set {
			userDefaults.set(newValue, forKey: UserDefaultKeys.hasLaunchedBefore.rawValue)
			userDefaults.synchronize()
		}
	}
	
}

// ----------------------------------------------------------------------------
// MARK: - Version/Build Strings
// ----------------------------------------------------------------------------
extension GEVersionMonitor {
	
	// Returns current short version as a String
	public var currentShortVersion: String {
		if let version = bundle.object(forInfoDictionaryKey: VersionKeys.shortVersion.rawValue) as? String {
			return version
		}
		return ""
	}
	
	// Returns current build number as a String
	public var currentBuild: String {
		if let build = bundle.object(forInfoDictionaryKey: VersionKeys.buildNumber.rawValue) as? String {
			return build
		}
		return ""
	}
	
	// Returns the app's version and build in the format: version (build) e.g. 1.0.0 (7)
	public var formattedVersion: String {
		return "\(currentShortVersion) (\(currentBuild))"
	}
	
}
