//
//  MyWYNewsController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/15.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class MyWYNewsController: NSViewController {
	
	let wyNewsView = WYNewsView.init(frame: CGRect.init(x: 0, y: 0, width: 400, height: 400))
	
	override func loadView() {
		self.view = self.wyNewsView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do view setup here.
		WYNetWorkManager.manager.requestNewsList { [weak self] (model) in
			guard let newsModel = model else {
				print("请求NewList失败")
				return
			}
			print("Code=\(String(describing: newsModel.code))")
			print("message=\(String(describing: newsModel.message))")
			print("newsmodel.items=\(newsModel.items)")
			
//			self?.wyNewsView.reloadDataWith(newsModel.items,callBack: self?.didSelecRow)
			self?.wyNewsView.reloadDataWith(newsModel.items, callBack: { (row, model) in
				
				let detailVC = WYNewsDeitailVC()
				self?.presentAsModalWindow(detailVC)
				let htmlString = WYNewsDetailViewModel().convertHtmlString(model: model)
				detailVC.detailView.reloadWebViewWith(htmlString)
			})
		}
	}
	
	/// 点击cell的时候会响应
//	var didSelecRow:((_ row:Int, _ model:WYContentEntity)->()) = {
//		(row, contenModel) in
//
//		print("在newsController中收到了回调\(contenModel)")
//	}
	
}



