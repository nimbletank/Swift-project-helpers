//
//  UIViewController+HelpKit.swift
//
//  Created by Georgios Erakleous on 07/06/2017.
//  Copyright © 2017 Georgios Erakleous. All rights reserved.
//

/*
----------------------------------------------
UIViewController+HelpKit 0.2 (using Swift 3.x)
----------------------------------------------

Usage/Features:
---------------
- showAlertWithTitle(title:mesage:)			:	Shows an alert controller with the given title and message
- showAlert(withError error:)				:	Shows an alert controller with the given error
- showLoadingSpinner()						:	Shows a basic loading spinner
- showLoadingSpinner(onView view:)			:	Shows a basic loading spinner on given view
- dismissLoadingSpinner()					:	Dismisses the loading spinner
- dismissKeyboardWhenTappedOnView()			:	Dismisses the keyboard when the user taps anywhere in the view except the text field

Changes:
--------
v.0.2:	added logic to show/dismiss a basic loading spinner and to dismiss the keyboard when the user taps anywhere in the view except the text field
v.0.1:	initial logic (added logic to show alerts)

*/

import UIKit

// ----------------------------------------------------------------------------
// MARK: - Alerts
// ----------------------------------------------------------------------------
extension UIViewController {
	
	// Shows an alert controller with the given title and message
	func showAlertWithTitle(_ title: String, message: String) {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let actionOK = UIAlertAction(title: "OK", style: .cancel)
		
		alertVC.addAction(actionOK)
		present(alertVC, animated: true, completion: nil)
	}
	
	// Shows an alert controller with the given error
	func showAlert(withError error: Error) {
		showAlertWithTitle("Error", message: error.localizedDescription)
	}
}

// ----------------------------------------------------------------------------
// MARK: - Basic Loading Spinner
// ----------------------------------------------------------------------------
extension UIViewController {

	private struct Keys {
		static var loadingView = "loadingViewKey"
	}
	
	private var basicLoadingView: UIView? {
		get {
			let view = objc_getAssociatedObject(self, &Keys.loadingView) as? UIView
			return view ?? UIView()
		}
		set {
			objc_setAssociatedObject(self, &Keys.loadingView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}
	
	// Shows a basic loading spinner
	func showLoadingSpinner() {
		showLoadingSpinner(onView: self.view)
	}
	
	// Shows a basic loading spinner on given view
	func showLoadingSpinner(onView view: UIView) {
		if let loadingView = self.basicLoadingView {
			loadingView.removeFromSuperview()
		}
		
		// setup the loading view
		let loadingView = UIView(frame: view.frame)
		loadingView.alpha = 0.0
		loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
		let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
		activityIndicator.startAnimating()
		loadingView.addSubview(activityIndicator)
		
		// layout
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
		activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
		
		view.addSubview(loadingView)
		self.basicLoadingView = loadingView
		
		// animate the loading view
		UIView.animate(withDuration: 0.25) { 
			loadingView.alpha = 1.0
		}
	}
	
	// Dismisses the loading spinner
	func dismissLoadingSpinner() {
		guard let loadingView = self.basicLoadingView else {
			return
		}
		
		// animate the loading view
		UIView.animate(withDuration: 0.25, animations: { 
			loadingView.alpha = 0.0
		}) { (finished) in
			loadingView.removeFromSuperview()
		}
	}
}

// ----------------------------------------------------------------------------
// MARK: - Dismiss keyboard on tap
// ----------------------------------------------------------------------------
extension UIViewController {
	
	// Dismisses the keyboard when the user taps anywhere in the view except the text field
	func dismissKeyboardWhenTappedOnView() {
		let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tapRecognizer.cancelsTouchesInView = true
		view.addGestureRecognizer(tapRecognizer)
	}
	
	@objc private func dismissKeyboard() {
		view.endEditing(true)
	}
}
