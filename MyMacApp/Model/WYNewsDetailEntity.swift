//
//  WYNewsDetailEntity.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/17.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import HandyJSON

class WYNewsDetailEntity: HandyJSON {

	var code:Int?
	var data:[String:Dictionary<String,Any>]?
	
	required init() {}
}

class WYContentEntity: HandyJSON {
	var img:[WYDetailImg] = []
	var sourceinfo:[String:String] = [:]
	var title:String = ""
	var body:String = ""
	var ptime:String = ""
	var picnews: Bool?
	var replyCount:Int = 0
	
	var replayBord:String = ""
	
	required init() { }
}

class WYDetailImg: HandyJSON {
	
	var ref:String = ""
	var src:String = ""
	var alt:String = ""
	var pixel:String = ""
	
	required init() {}
}
