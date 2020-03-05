//
//  GoldModel.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/5.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa
import HandyJSON

class GoldModel:HandyJSON {
	
	var code:Int?
	var msg : String?
	var mostHigh : Double?
	var mostLow : Double?
	var close : Double?
	var open : Double?
	
	
	func mapping(mapper: HelpingMapper) {
		mapper <<<
			self.mostHigh <-- "data.mostHigh"
		mapper <<<
			self.mostLow <-- "data.mostLow"
		mapper <<<
			self.close <-- "data.close"
		mapper <<<
			self.open <-- "data.open"
	}

	required init() {}
}

//{
//  "code": 10000,
//  "msg": "请求成功",
//  "data": {
//    "mostHigh": 17.25,
//    "mostLow": 17.1,
//    "close": 17.19,
//    "open": 17.2
//  }
//}
