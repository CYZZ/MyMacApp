//
//  GoldViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/5.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa

class GoldViewController: NSViewController {
	
	let goldView = GoldView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 400))
	
	override func viewDidLoad() {
		self.loadData()
		goldView.buttonCallBack = {
			[weak self] button in
			self?.loadData()
		}
		
		self.monitorKeyBorad()
	}
	// 开始加载数据
	func loadData() {
		// 获取gold数据
		GoldManager.manager.requestGoldData { [weak self] (model) in
			guard let goldModel = model else {
				print("请求GoldModel失败")
				return
			}
			self?.goldView.setGoldModel(goldModel)
		}
		// 获取silver数据
		GoldManager.manager.requestfSilverData { [weak self] (model) in
			guard let silverModel = model else {
				print("请求GoldModel失败")
				return
			}
			self?.goldView.setSilverModel(silverModel)
		}
		
		GoldManager.manager.requestTencentData { (json) in
			print("获取的腾讯数据json=\(json)")
		}
	}

	override func loadView() {
		self.view = goldView
	}
	/// 开始监听键盘点击
	func monitorKeyBorad() {
		NSEvent .addLocalMonitorForEvents(matching: .keyDown, handler: { [weak self] (event) -> NSEvent? in
			let iseque = event.characters?.elementsEqual("\u{03}")
			if iseque == true {
				self?.loadData()

			}
//			print(iseque)
			return event
		})
	}
	
	
	deinit {
		print("GoldViewController deinit")
	}
}
