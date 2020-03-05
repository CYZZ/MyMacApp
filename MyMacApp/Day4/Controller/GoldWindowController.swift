//
//  GoldWindowController.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/5.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa

class GoldWindowController: NSWindowController {

	override func windowDidLoad() {
//		self.window?.contentViewController = GoldViewController()
		self.contentViewController = GoldViewController()
		self.window?.maxSize = NSSize(width: 500, height: 500)
		self.window?.minSize = NSSize(width: 200, height: 200)
		print("GoldWindowController windowDidLoad")
	}
	
	deinit {
		print("GoldWindowController deinit")
	}
}
