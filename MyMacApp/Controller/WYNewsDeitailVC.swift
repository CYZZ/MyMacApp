//
//  WYNewsDeitailVC.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/17.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class WYNewsDeitailVC: NSViewController {
	
	let detailView = WYDetialView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
	
	override func loadView() {
		self.view = detailView
	}
	
//	func setupView() {
//		
//	}
    
}
