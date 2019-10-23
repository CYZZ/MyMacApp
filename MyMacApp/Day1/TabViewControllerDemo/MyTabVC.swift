//
//  MyTabVC.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/18.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class MyTabVC: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		self.setupView()
    }
	
	/// 初始化布局
	func setupView() {
		
		let item1 = NSTabViewItem.init(viewController: OneViewController())
		item1.label = "第一个"
		
//		item1.image = NSImage.nstemplate
		
		let item2 = NSTabViewItem.init(viewController: TwoViewController())
		item2.label = "第二个"
		
		self.tabViewItems = [item1,item2]
		// 设置样式
		self.tabStyle = .toolbar
	}
	
	override func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
		super.tabView(tabView, didSelect: tabViewItem)
		print("tabView DidSelect")
	}
    
	
}
