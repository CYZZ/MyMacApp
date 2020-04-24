//
//  WYNetWorkManager.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/16.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import Alamofire

class WYNetWorkManager: NSObject {
	
	/// 创建单例
	static let manager: WYNetWorkManager = {
		let instance = WYNetWorkManager()
		return instance
	}()
	
	/// 获取新闻数据
	func requestNewsList(callBack:@escaping(_ model:WYNewsListModel?)->Void) {
		let urlString = "https://gw.m.163.com/nc/api/v1/feed/dynamic/headline-list?passport=&devId=04t9kC29sLRKF4SBKuUzubT6oPF82ZeVgdqa23lqvQsyuYRWeXA6QrJnzCTrtWxf&version=60.0&spever=false&net=wifi&lat=gh/Mm4TmU0kWbdL5bMAA5Q%3D%3D&lon=FH4%2BYDWcJPb3Bn3tt9rCkg%3D%3D&ts=1571205805&sign=s5aK09xHGxSy7/%2B5VeBIO4X%2BdbUAKyqN8SkvuFvVrhB48ErR02zJ6/KXOnxX046I&encryption=1&canal=appstore&offset=0&size=10&fn=1&LastStdTime=&open=&openpath=&sl=0&from=toutiao&prog=Rpic2&refreshCard=kill_process_1"

		self.GET(url: urlString, params: nil, success: { (json) in
			let model = WYNewsListModel.deserialize(from: json as? [String:Any])
			// 执行成功的回调
			callBack(model)
		}) { (code, message) in
			print("请求失败message=\(message)")
			// 网络请求失败就直接返回空值
			callBack(nil)
		}
	}
	
	func requestNewsDetailData(id:String, callBack:@escaping(_ model:WYContentEntity?)->Void) {
		let urlString = "https://gw.m.163.com/nc-omad/api/v1/article/preload/\(id)/full"
		
		self.GET(url: urlString, params: nil, success: { (json) in
			
			let entity = WYNewsDetailEntity.deserialize(from: json as? [String:Any])
			
			guard let data = entity?.data else {
				callBack(nil)
				return
			}
			
			let model = WYContentEntity.deserialize(from: data[id])
			
			callBack(model)
			
		}) { (code, message) in
			callBack(nil)
		}
		
	}
	
	/// 发起网络请求
	/// - Parameter url: 请求连接
	/// - Parameter method: 请求方法
	/// - Parameter params: 请求参数
	/// - Parameter success: 请求成功h之后的回调
	/// - Parameter failure: 请求失败之后的回调
	func request(_ url:URLConvertible,method:HTTPMethod = .get,params:Dictionary<String,Any>?,success:@escaping(_ response:Any)->(),failure:((_ code:Int?,_ message: String)->Void)?) {
		
		AF.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil)
			.responseJSON { [weak self] (response)  in
				switch response.result {
				case .success(let json):
					success(json)
				case .failure(let error):
//					failure?(error.responseCode,"\(String(describing: error.errorDescription))")
					self?.failureHandle(failure: failure, stateCode: error.responseCode, message: String(describing: error.errorDescription))
				}
		}
	}
	
	func failureHandle(failure:((Int?,String) -> Void)?,stateCode:Int?,message:String) -> Void {
		// 可以设置弹窗提示
		// 执行回调
		failure?(stateCode,message)
	}
}

extension WYNetWorkManager {
	
	/// GET请求
	/// - Parameter url: 链接
	/// - Parameter params: 参数
	/// - Parameter success: 成功回调
	/// - Parameter failure: 失败回调
	func GET(url:String,params:[String:Any]?,success:@escaping(_ json:Any)->(),failure:((_ code:Int?,_ message:String)->Void)?) -> Void {
		self.request(url, method: .get, params: params, success: success, failure: failure)
	}
	
	/// POST请求
	/// - Parameter url: 链接
	/// - Parameter params: 参数
	/// - Parameter success: 成功回调
	/// - Parameter failure: 失败回调
	func POST(url:String,params:[String:Any]?,success:@escaping(_ json:Any)->(),failure:((_ code:Int?,_ message:String)->Void)?) -> Void {
		self.request(url, method: .post, params: params, success: success, failure: failure)
	}
	
	func GETJavaScript(url:String,params:[String:Any]?,success:@escaping(_ json:Any)->(),failure:((_ code:Int?,_ message:String)->Void)?) -> Void {
		AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil)
			.responseString { (response) in
				switch response.result {
				case .success(let json):
					success(json)
				case .failure(let error):
					self.failureHandle(failure: failure, stateCode: error.responseCode, message: String(describing: error.errorDescription))
				}
		}
	}
	
}






