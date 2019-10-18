//
//  WYNewsDetailViewModel.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/17.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

class WYNewsDetailViewModel: NSObject {

	func convertHtmlString(model:WYContentEntity) -> String {
		var body = ""
		body.append("<div class=\"title\">\(model.title)</div>")
		body.append("<div class=\"time\">\(model.ptime)</div>")
		body.append(model.body)
		
		for detailImgModel in model.img {
			var imgHtml = ""
			// 设置img的div
			imgHtml.append("<div class=img-parent>")
			let pixel = detailImgModel.pixel.components(separatedBy: "*")
			
			let width = Float(pixel.first ?? "0")!
			let height = Float(pixel.last ?? "0")!
			
//			let maxWidth = NSScreen.main?.frame.width ?? 0
//
//			if CGFloat(width) > maxWidth {
//				width = Float(maxWidth)
//				height = Float(maxWidth) / width * height
//			}
//			let onload = "this.onclick = function() {  window.location.href = 'sx://chiyz.com/abcdefghello?src=' +this.src+'&top=' + this.getBoundingClientRect().top + '&whscale=' + this.clientWidth/this.clientHeight ;};"
			
			imgHtml.append("<img onload=\("") width=\(width) height=\(height) src=\(detailImgModel.src)>")
			imgHtml.append("</div>")
			
			// 通过查找对应的唯一标识进行标签替换
//			let result = body.contains(detailImgModel.ref)
//			print("result = \(result)")
			
			body = body.replacingOccurrences(of: detailImgModel.ref, with: imgHtml)
//			_ = body.replacingOccurrences(of: detailImgModel.ref, with: imgHtml, options: .caseInsensitive, range: Range.init(NSRange.init(location: 0, length: body.count), in: body))
			
		}
		
		return body
	}
	
	
}

//https://gw.m.163.com/nc-omad/api/v1/article/preload/ERL0C2T90517UG0G/full
