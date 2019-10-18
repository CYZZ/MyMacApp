//
//  WYDetialView.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/17.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit
import WebKit

class WYDetialView: NSView {
	
	lazy var webView: WKWebView = {
		let webView = WKWebView()
		webView.navigationDelegate = self
		return webView
	}()
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		self.setupView()
	}
	
	/// 初始化页面布局
	func setupView() {
		self.addSubview(self.webView)
		self.webView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview().inset(NSEdgeInsetsZero)
		}
	}
	
	/// 加载html字符串
	func reloadWebViewWith(_ htmlStr:String) {
		self.webView.loadHTMLString(htmlStr, baseURL: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
		
        // Drawing code here.
    }
    
}

extension WYDetialView:WKNavigationDelegate {
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		print("web开始加载")
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		print("web加载完成")
	}
}
