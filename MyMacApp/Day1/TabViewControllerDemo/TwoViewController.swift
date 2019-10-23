//
//  TwoViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/22.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class TwoViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//		view.layer?.backgroundColor = NSColor.lightGray.cgColor
		self.preferredContentSize = view.frame.size
		print("TwoViewController -》ViewDidLoad")
    }
	
	override func loadView() {
		self.view = NSView.init(frame: NSRect.init(x: 0, y: 0, width: 300, height: 300))
	}
    
}
