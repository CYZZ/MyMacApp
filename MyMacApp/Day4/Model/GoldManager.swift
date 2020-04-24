//
//  GoldManager.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/5.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa

class GoldManager {

	/// 创建单例
	static let manager: GoldManager = {
		let instance = GoldManager()
		return instance
	}()
	
	/// 获取Gold现货数据
	func requestGoldData(callBack:@escaping(_ model:GoldModel?)->Void) {
		let urlString = "http://goldayapp.golday999.com/goldayapp/getPriceDataOfDay/LLG"

		WYNetWorkManager.manager.GET(url: urlString, params: nil, success: { (json) in
			let model = GoldModel.deserialize(from: json as? [String:Any])
			// 执行成功的回调
			callBack(model)
		}) { (code, message) in
			print("请求失败message=\(message)")
			// 网络请求失败就直接返回空值
			callBack(nil)
		}
	}
	
	/// 获取Silver现货数据
	func requestfSilverData(callBack:@escaping(_ model:GoldModel?)->Void) {
		let urlString = "http://goldayapp.golday999.com/goldayapp/getPriceDataOfDay/LLS"

		WYNetWorkManager.manager.GET(url: urlString, params: nil, success: { (json) in
			let model = GoldModel.deserialize(from: json as? [String:Any])
			// 执行成功的回调
			callBack(model)
		}) { (code, message) in
			print("请求失败message=\(message)")
			// 网络请求失败就直接返回空值
			callBack(nil)
		}
	}
	
	/// 获取新浪数据
	func requestSinaData(callBack:@escaping(_ data:Any?)->Void) {
//		let urlString = "http://hq.sinajs.cn/list=sh601006"
		let urlString = "http://hq.sinajs.cn/list=jd2009"
		WYNetWorkManager.manager.GETJavaScript(url: urlString, params: nil, success: { (json) in
			print("返回的json=\(json)")
			callBack(json);
		}) { (code, message) in
			print("请求失败message=\(message)")
			callBack(nil)
		}
	}
	
	/// 获取新浪数据
		func requestTencentData(callBack:@escaping(_ data:Any?)->Void) {
			let urlString = "https://proxy.finance.qq.com/ifzqgtimg/appstock/app/rank/worldCommodities"
//			WYNetWorkManager.manager.GETJavaScript(url: urlString, params: nil, success: { (json) in
//				print("返回的json=\(json)")
//				callBack(json);
//			}) { (code, message) in
//				print("请求失败message=\(message)")
//				callBack(nil)
//			}
			WYNetWorkManager.manager.GET(url: urlString, params: nil, success: { (json) in
				// 执行成功的回调
				callBack(json)
			}) { (code, message) in
				print("请求失败message=\(message)")
				// 网络请求失败就直接返回空值
				callBack(nil)
			}
		}
}
