//
//  OneViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/22.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit

class OneViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//		view.layer?.backgroundColor = NSColor.orange.cgColor
		self.preferredContentSize = view.frame.size
		print("OneViewController -》ViewDidLoad")
		self.setupView()
    }
	
	/// 初始化页面
	func setupView() {
		let button = NSButton()
		button.title = "测试按钮"
		self.view.addSubview(button)
		
		button.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().inset(50)
		}
	}
	
	override func loadView() {
		self.view = NSView.init(frame: CGRect.init(x: 0, y: 0, width: 400, height: 400))
	}
    
}
