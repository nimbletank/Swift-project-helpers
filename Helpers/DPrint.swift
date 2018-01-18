//
//  DPrint.swift
//
//  Created by Georgios Erakleous on 29/06/2017.
//  Copyright © 2017 Georgios Erakleous. All rights reserved.
//

import Foundation
/*
-----------
DPRint 0.2
-----------

Small Debug log/print that shows the file name, function name and line number

#item			Any      	The item to print.
#path			String		The name of the file in which it appears.
#functionName	String   	The name of the declaration in which it appears.
#lineNo			Int      	The line number on which it appears.
#messageType	DPrintMessageType	The type of icon to show when printing the message.

Usage:
------
DPrint("blah", ["blah", "blah"], ["blah": 6, "bla7h": 8], 9)
DPrintText("text")
DPrintDebug("A debug message")
DPrintError("An error message")
DPrintFixMe("Fix me please")
DPrintWarning("Please be careful")

Changes:
--------
v.0.1_29_06_2017:	initial logic
v.0.2_01_12_2017:	added log icons, added support for logging text/debug/warning/error/fixme type of items (messages)

*/

public enum DPrintMessageType: String {
	case text = "🔤 | "
	case debug = "🚥 | "
	case warning = "⚠️ | "
	case error = "❌ | "
	case fixme = "💊 | "
	case none = ""
}

public func DPrint(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line, messageType: DPrintMessageType = .none) {
	#if DEBUG
		let file = path.components(separatedBy: "/").last ?? "Unknown file"
		print("\(messageType.rawValue)File: \(file) | Func: \(functionName) | line: \(lineNo)")
		for item in items {
			print(" -> \(item)")
		}
	#endif
}

// ----------------------------------------------------------------------------
// MARK: - Convenience print functions
// ----------------------------------------------------------------------------

// Prints a debug message with a text icon
public func DPrintText(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
	for item in items {
		DPrint(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .text)
	}
}

// Prints a debug message with a debug icon
public func DPrintDebug(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
	for item in items {
		DPrint(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .debug)
	}
}

// Prints a debug message with a warning icon
public func DPrintWarning(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
	for item in items {
		DPrint(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .warning)
	}
}

// Prints a debug message with an error icon
public func DPrintError(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
	for item in items {
		DPrint(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .error)
	}
}

// Prints a debug message with a fix me icon
public func DPrintFixMe(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
	for item in items {
		DPrint(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .fixme)
	}
}

// ----------------------------------------------------------------------------
// MARK: - Class implementation
// ----------------------------------------------------------------------------

//enum DPrintMessageType: String {
//	case text = "🔤 | "
//	case debug = "🚥 | "
//	case warning = "⚠️ | "
//	case error = "❌ | "
//	case fixme = "💊 | "
//	case none = ""
//}
//
//class DPrint {
//
//	class func log(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line, messageType: DPrintMessageType = .none) {
//		#if DEBUG
//			let file = path.components(separatedBy: "/").last ?? "Unknown file"
//			print("\(messageType.rawValue)File: \(file) | Function: \(functionName) | lineNo: \(lineNo)")
//			for item in items {
//				print(" -> \(item)")
//			}
//		#endif
//	}
//
//	// ----------------------------------------------------------------------------
//	// MARK: - Convenience log/print functions
//	// ----------------------------------------------------------------------------
//
//	// Prints a debug message with a text icon
//	class func logText(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
//		for item in items {
//			log(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .text)
//		}
//	}
//
//	// Prints a debug message with a debug icon
//	class func logDebug(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
//		for item in items {
//			log(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .debug)
//		}
//	}
//
//	// Prints a debug message with a warning icon
//	class func logWarning(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
//		for item in items {
//			log(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .warning)
//		}
//	}
//
//	// Prints a debug message with an error icon
//	class func logError(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
//		for item in items {
//			log(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .error)
//		}
//	}
//
//	// Prints a debug message with a fix me icon
//	class func logFixMe(_ items: Any..., path: String = #file, functionName: String = #function, lineNo: Int = #line) {
//		for item in items {
//			log(item, path: path, functionName: functionName, lineNo: lineNo, messageType: .fixme)
//		}
//	}
//
//}
