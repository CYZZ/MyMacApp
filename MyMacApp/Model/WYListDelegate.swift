//
//  WYListDelegate.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/15.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class WYListDelegate: NSObject {
	
//	var items = [newsItem].self
	var items:[newsItem] = []
	
//	func didSelecRow(callBack:(_ row:Int, _ item:newsItem)->())  {
//
//	}
//	let model:WYContentEntity
	var didSelecRow:((_ row:Int, _ model:WYContentEntity)->())?

}

extension WYListDelegate:NSTableViewDelegate,NSTableViewDataSource {
	
	func numberOfRows(in tableView: NSTableView) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		//获取表格列的标识符
//		let title = items[row].title!
		
		var cell:WYCellView? = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue:"cell"), owner: nil) as? WYCellView
		if cell == nil {
			cell = WYCellView()
			cell?.identifier = NSUserInterfaceItemIdentifier(rawValue: "cell")
		}
		
		
		cell?.setItem(self.items[row])
		
		return cell
	}
	
	@objc func testButtonCLick()  {
		
	}
	
	func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
		return 88
	}
	
	func tableViewSelectionDidChange(_ notification: Notification) {
		
		let tableView:NSTableView = notification.object as! NSTableView
		let currenModel = self.items[tableView.selectedRow]
	
		WYNetWorkManager.manager.requestNewsDetailData(id: currenModel.id) { (contenModel) in
			
			print("contentModel = \(String(describing: contenModel))")
			guard let model = contenModel else {
				return
			}
			
			/// 执行回调
			self.didSelecRow?(tableView.selectedRow,model)
			
		}
//		print("tableViewSelectionDidChange\(notification)")
		
		
	}
	
}
