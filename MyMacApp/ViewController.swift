//
//  ViewController.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/15.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit
import SwiftUI

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	@IBAction func buttonClick(_ sender: NSButton) {
		self.presentAsModalWindow(MyWYNewsController())
//		self.present(MyWYNewsController(), animator: self)
//		self.animatePresentation(of: MyWYNewsController(), from: self)
//		self.presentAsSheet(MyWYNewsController())
//		self.preferredContentSizeDidChange(for: MyWYNewsController())
//		NSApplication.shared.keyWindow.show
		
	}
	@IBAction func alertButtonClick(_ sender: NSButton) {
//		let alert = NSAlert()
//		alert.addButton(withTitle: "OK")
//		alert.messageText = "Hello World!"
//		// 描述性文字
//		alert.informativeText = "this is my first MAC app"
//
//		alert.beginSheetModal(for: self.view.window!) { (responCode) in
//			print("responCode = \(responCode)")
//		}
		self.presentAsModalWindow(MyTabVC())
	}
	@IBAction func qrCodeClick(_ sender: NSButton) {
		self.presentAsModalWindow(MyQRCodeVC())
	}
	
	@IBAction func testSwiftUIClick(_ sender: Any) {
//		let VC = NSHostingController(rootView: MyContentView())
		let VC = MYtest3Controller()
		self.presentAsModalWindow(VC)
	}
	@IBAction func showGoldWindow(_ sender: NSButton) {
//		let style = NSWindow.StyleMask.closable | NSWindow.StyleMask.miniaturizable | NSWindow.StyleMask.resizable
		let window = NSWindow.init(contentRect: CGRect(x: 100, y: 100, width: 400, height: 400), styleMask: [.resizable,.miniaturizable,.closable,.titled], backing: .buffered, defer: true)
		window.title = "数据详情"
		window.titleVisibility = .visible
		window.center()
		window.maxSize = NSSize(width: 700, height: 600)
		window.minSize = NSSize(width: 200, height: 200)
		
		print("hasTItleBar = \(window.hasTitleBar)")
		let goldWinC = GoldWindowController()
		goldWinC.window = window
		
		let goldVC = GoldViewController()
		window.contentViewController = goldVC
		
//		window.orderFront(self.view.window)
		window.makeKeyAndOrderFront(nil)
		self.view.window?.close()
		
	}
	
	deinit {
		print("ViewController deinit")
	}
	
}

extension ViewController:NSViewControllerPresentationAnimator {
	func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
		
	}
	
	func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
		
	}
	
}

