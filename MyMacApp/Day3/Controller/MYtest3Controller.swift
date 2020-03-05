//
//  MYtest3Controller.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/29.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SwiftUI
import SnapKit

class MYtest3Controller: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
	
	override func loadView() {
		self.view = NSView.init(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
//		let contentV = NSHostingView.init(rootView: MyContentView())
//		self.view.addSubview(contentV)
//		
//		contentV.snp.makeConstraints { (make) in
//			make.top.equalToSuperview().inset(50)
//			make.left.equalToSuperview().inset(50)
//		}
	}
    
}
