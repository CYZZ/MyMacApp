//
//  ViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/15.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func buttonClick(_ sender: NSButton) {
		self.presentAsModalWindow(MyWYNewsController())
//		self.present(MyWYNewsController(), animator: self)
//		self.animatePresentation(of: MyWYNewsController(), from: self)
//		self.presentAsSheet(MyWYNewsController())
//		self.preferredContentSizeDidChange(for: MyWYNewsController())
//		NSApplication.shared.keyWindow.show
		
	}
}

extension ViewController:NSViewControllerPresentationAnimator {
	func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
		
	}
	
	func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
		
	}
	
}

