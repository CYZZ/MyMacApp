//
//  WYNewsListModel.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/16.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import HandyJSON

class WYNewsListModel: HandyJSON {
	var code:Int?
	var message : String?
	var data:[String:Any]?
//	var items:[Dictionary<String,Any>] = []
	var items:[newsItem] = []
//	var data:[String]?
	
	required init() {}
	
	func mapping(mapper: HelpingMapper) {
		mapper <<<
			self.items <-- "data.items"
	}
}

class newsItem: HandyJSON {
	var template:String?
	var sourceId:String?
	var id:String = ""
	var recomCount: Int?
	var img: String?
//	upTimes: 142,
//	clickCount: 0,
//	recTime: 1571205948,
//	lmodify: "2019-10-16 12:27:52",
	var source: String?
//	program: "Rpic2",
	var title: String?
//	subCardIndex: 0,
//	recType: -1,
//	interest: "AR+",
//	danmu: 1,
//	clkNum: 0,
//	boardid: "sports2_bbs",
//	rank: 0,
//	hasAD: 1,
//	showGuanZhu: "0",
//	id: "ERJITLE90005877U",
//	imgsrc: "http://cms-bucket.ws.126.net/2019/10/16/c2e332889abc49a8bdbe6c3facf08861.png",
//	hotCommentShow: 1,
	var ptime: String?
//	hasHead: 0,
//	imgType: 0,
//	adtype: 0,
//	picCount: 0,
//	albumCount: 0,
//	docid: "ERJITLE90005877U",
//	unfoldMode: 0,
//	showStartIndex: 0,
//	downTimes: 0,
//	recprog: "KUNLUN_OLDUSER",
//	realSourceId: "",
//	reqId: "4004fdd0-1d98-406c-b07d-f71d8ce18413",
//	refreshPrompt: 0,
//	commentStatus: 1,
//	imgLineNum: 3,
//	replyCount: 2388,
//	unlikeReason: [
//	{
//	icon: "http://cms-bucket.ws.126.net/2019/04/26/9cb4e7cda5104349ac9e00fd89549951.png",
//	title: "不感兴趣/99"
//	},
//	{
//	subtitle: "内容质量差",
//	icon: "http://cms-bucket.ws.126.net/2019/04/26/c40b08abb5c840478bddb201ae8e3d53.png",
//	title: "举报内容",
//	subkeys: [
//	{
//	title: "内容质量差/6"
//	}
//	]
//	}
//	],
//	recNews: 0,
//	imgsum: 0,
//	replyid: "ERJITLE90005877U",
//	prompt: "成功为您推荐10条新内容"
	
	var imgnewextra:[String?]=[]
//	imgnewextra: [
//	{
//	imgsrc: "http://cms-bucket.ws.126.net/2019/10/15/0ce85e2b8d15446ba5562f747ffaf85a.jpeg"
//	},
//	{
//	imgsrc: "http://cms-bucket.ws.126.net/2019/10/15/d82b37e937a84d3db9df86ad634008ec.jpeg"
//	}
//	]
	
	func mapping(mapper: HelpingMapper) {
		mapper <<<
			self.imgnewextra <-- TransformOf<[String?], [Dictionary<String,String>]>(fromJSON: { (imgArr) -> [String?] in
				return [imgArr?.first?["imgsrc"],imgArr?.last?["imgsrc"]]
				//				return []
			}, toJSON: { (imgDic) -> [Dictionary<String,String>]? in
				
				return nil
			})
	}
	
	required init() {}
}

//code: 0,
//message: "成功",
//data: {

/*
{
template: "normal1",
sourceId: "T1516357835088",
recomCount: 0,
img: "http://cms-bucket.ws.126.net/2019/10/16/c2e332889abc49a8bdbe6c3facf08861.png",
upTimes: 142,
clickCount: 0,
recTime: 1571205948,
lmodify: "2019-10-16 12:27:52",
source: "网易体育",
program: "Rpic2",
title: "曝LBJ曾对萧华爆粗:联盟双标 若球员发推必遭处罚",
subCardIndex: 0,
recType: -1,
interest: "AR+",
danmu: 1,
clkNum: 0,
boardid: "sports2_bbs",
rank: 0,
hasAD: 1,
showGuanZhu: "0",
id: "ERJITLE90005877U",
imgsrc: "http://cms-bucket.ws.126.net/2019/10/16/c2e332889abc49a8bdbe6c3facf08861.png",
hotCommentShow: 1,
ptime: "2019-10-16 08:12:27",
hasHead: 0,
imgType: 0,
adtype: 0,
picCount: 0,
albumCount: 0,
docid: "ERJITLE90005877U",
unfoldMode: 0,
showStartIndex: 0,
downTimes: 0,
recprog: "KUNLUN_OLDUSER",
realSourceId: "",
reqId: "4004fdd0-1d98-406c-b07d-f71d8ce18413",
refreshPrompt: 0,
commentStatus: 1,
imgLineNum: 3,
replyCount: 2388,
unlikeReason: [
{
icon: "http://cms-bucket.ws.126.net/2019/04/26/9cb4e7cda5104349ac9e00fd89549951.png",
title: "不感兴趣/99"
},
{
subtitle: "内容质量差",
icon: "http://cms-bucket.ws.126.net/2019/04/26/c40b08abb5c840478bddb201ae8e3d53.png",
title: "举报内容",
subkeys: [
{
title: "内容质量差/6"
}
]
}
],
recNews: 0,
imgsum: 0,
replyid: "ERJITLE90005877U",
prompt: "成功为您推荐10条新内容"
}
*/
