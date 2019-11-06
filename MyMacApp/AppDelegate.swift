//
//  AppDelegate.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/15.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	lazy var statusItem: NSStatusItem = {
		let statusBar = NSStatusBar.system
//		NSVariableStatusItemLength
		// 设置动态宽度的NSStatusItem对象
		let item = statusBar.statusItem(withLength: NSStatusItem.squareLength)
		return item
	}()

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		self.setupStatus()
	}
	
	/// 初始化状态栏
	func setupStatus() {
		
		let img = NSImage.init(named: "swiftStatus")
//		img?.resize(CGSize(width: 200, height: 200))
//		img?.resizingMode = .stretch
		self.statusItem.button?.image        = img
		self.statusItem.button?.imageScaling = .scaleAxesIndependently
		self.statusItem.button?.toolTip      = "你点我试试"
		self.statusItem.button?.target       = self
		self.statusItem.button?.action       = #selector(itemClick)
		self.statusItem.button?.sendAction(on: .leftMouseDown)
		

		
		// 添加下拉列表
		let subMenu = NSMenu.init(title: "Load_Text")
		subMenu.addItem(withTitle: "Load1", action: #selector(load1Click), keyEquivalent: "E")
		subMenu.addItem(withTitle: "Load2", action: #selector(load2Click), keyEquivalent: "R")
		subMenu.addItem(withTitle: "exit", action: #selector(exitButtonClick), keyEquivalent: "Q")
		self.statusItem.menu = subMenu
	}
	
	@objc func itemClick() {
		print("点击了状态栏的按钮")
	}
	
	@objc func load1Click() {
		print("点击了第一个选项")
	}
	
	@objc func load2Click() {
		print("点击了第二个选项")

	}
	
	@objc func exitButtonClick() {
		exit(0)
	}
	
	

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}

	// 当关闭最后一个窗口的时候应用程序退出
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
	
//	func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
//		NSApp.activate(ignoringOtherApps: false) // 取消其他应用的响应
//		// 需要主窗口显示自己当前的页面
////		self.windo
//		return true
//	}

}

