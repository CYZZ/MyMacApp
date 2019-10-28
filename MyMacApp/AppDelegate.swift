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



	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
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

