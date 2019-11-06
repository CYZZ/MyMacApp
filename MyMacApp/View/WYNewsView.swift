//
//  WYNewsView.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/16.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class WYNewsView: NSView {
	
	let mydelegate = WYListDelegate()
	
	lazy var tableView: NSTableView = {
		let table        = NSTableView.init(frame: NSRect.init(x: 0, y: 0, width: 400, height: 400))
		let dataDelegate = mydelegate
		// 需要保存实例才能进行
		table.delegate   = dataDelegate
		table.dataSource = dataDelegate
		
		let column1      = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier(rawValue: "column1"))
		column1.title    = "标题1"
		column1.minWidth = 300
		table.addTableColumn(column1)
		
//		let column2 = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier(rawValue: "column2"))
//		column2.title = "标题2"
//		table.addTableColumn(column2)
//		
//		let column3 = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier(rawValue: "column3"))
//		column1.title = "标题3"
//		table.addTableColumn(column3)
		
		table.backgroundColor = NSColor.lightGray
		return table
	}()
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		
		self.setupView()
	}
	
	/// 初始化页面布局
	func setupView() {
		let scrollView = NSScrollView.init(frame: NSRect.init(x: 0, y: 0, width: 400, height: 400))
		self.addSubview(scrollView)
		scrollView.documentView = self.tableView
		
		scrollView.snp.makeConstraints { (make) in
			make.edges.equalTo(0)
		}
	}
	
	func reloadDataWith(_ items:[newsItem], callBack:((_ row:Int, _ model:WYContentEntity)->())?) {
		mydelegate.items = items
		mydelegate.didSelecRow  = callBack
		self.tableView.reloadData()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    
}
