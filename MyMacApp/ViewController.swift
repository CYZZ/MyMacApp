//
//  ViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/10.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

	@IBOutlet weak var urlTextField: NSTextField!
	@IBOutlet weak var myWebView: WKWebView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		myWebView.navigationDelegate = self
		
		// Do any additional setup after loading the view.
	}
	@IBAction func buttonClick(_ sender: NSButton) {
		let urlStr = urlTextField.stringValue
		let weburl = URL.init(string: urlStr)!
		let request = URLRequest.init(url: weburl)
		myWebView.load(request)
//		myWebView.load(request)
	}
	
	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
}

extension ViewController:WKNavigationDelegate {
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		print("func decidePolicyFor\(webView)")
	}
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		print("func didStartProvisionalNavigation\(webView)")
	}
	
	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		print("func didFail\(webView)")
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		print("func didFinish\(webView)")
	}
	
	
}

