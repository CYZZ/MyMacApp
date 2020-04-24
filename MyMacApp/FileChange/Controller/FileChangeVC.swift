//
//  FileChangeVC.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/25.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa

class FileChangeVC: NSViewController {
	@IBOutlet weak var singleTextFiled: NSTextField!
	@IBOutlet weak var createTimeTextField: NSTextField!
	@IBOutlet weak var changeTimeTextField: NSTextField!
	@IBOutlet weak var lastOpenTextField: NSTextField!
	@IBOutlet weak var selectComboBox: NSComboBox!
	
	@IBOutlet weak var timeShowLabel: NSTextField!
	
	 let timeFormate:String = "yyyyMMdd-HHmm"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		timeShowLabel.stringValue = "创建时间：（时间格式\(timeFormate)）"
		selectComboBox.selectItem(at: 0) // 默认选中第一个
    }
	@IBAction func changeButtonClick(_ sender: Any) {
		
		let fm = FileManager.default // 文件管理
		
		if (selectComboBox.indexOfSelectedItem == 0) {
			/// 修改单个文件
			self.changeFileTimeAt(path: singleTextFiled.stringValue)
		} else if (selectComboBox.indexOfSelectedItem == 1) {
			// 修改一级子文件
			do {
				var isDir:ObjCBool = false
				let fileExit = fm.fileExists(atPath: singleTextFiled.stringValue, isDirectory: &isDir)
				self.changeFileTimeAt(path: singleTextFiled.stringValue)
				if (fileExit == true && isDir.boolValue == true) {
					let subPaths = try fm.contentsOfDirectory(atPath: singleTextFiled.stringValue)
					print("获取的子文件=\(subPaths),isdir=\(isDir)")
					for item in subPaths {
						self.changeFileTimeAt(path: singleTextFiled.stringValue.appending("/\(item)"))
					}
				} else {
					
				}
				
				
			}catch {
				print(error)
			}
		} else {
		// 修改文件夹下的所有文件
			let dirEnum = fm.enumerator(atPath: singleTextFiled.stringValue)
			
			for item in dirEnum!.allObjects as! [String] {
				self.changeFileTimeAt(path: singleTextFiled.stringValue.appending("/\(item)"))
			}
		}
		
		
	}
	@IBAction func readFIleButtonClick(_ sender: Any) {
		
		let fm = FileManager.default
		do {
			let dic = try fm.attributesOfItem(atPath: singleTextFiled.stringValue)
			print("读取的数据Dic=\(dic)")
			
			let dateFormatter = DateFormatter()
			dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT+0800") // 默认是东八区
			dateFormatter.dateFormat = timeFormate
			
			let createDate = dic[.creationDate] as! Date
			let modifiDate = dic[.modificationDate] as! Date
			
			createTimeTextField.stringValue = dateFormatter.string(from: createDate)
			changeTimeTextField.stringValue = dateFormatter.string(from: modifiDate)
		} catch {
			
		}
	}
	
	func changeFileTimeAt(path:String) {
		
		let dateFormatter = DateFormatter()
		dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT+0800") // 默认是东八区
		dateFormatter.dateFormat = timeFormate
		
		// 文件创建时间
		let createDate = dateFormatter.date(from: createTimeTextField.stringValue)
		guard let creDate = createDate  else {
			showError(str: "创建时间格式有误")
			return
		}
		// 文件修改时间
		let lastChangeDate = dateFormatter.date(from: changeTimeTextField.stringValue)
		guard let chanDate = lastChangeDate  else {
			showError(str: "”最后修改时间”格式有误")
			return
		}
		// 文件最后打开时间
		let lastOpenDate = dateFormatter.date(from: lastOpenTextField.stringValue)
		guard let openDate = lastOpenDate  else {
			showError(str: "”最后打开时间”格式有误")
			return
		}
		
		let fm = FileManager.default
		
		do {
			if (createTimeTextField.stringValue.count > 0) {
				_ = try fm.setAttributes([.creationDate:creDate], ofItemAtPath: path)
			}
			if (changeTimeTextField.stringValue.count > 0) {
				_ = try fm.setAttributes([.modificationDate:chanDate], ofItemAtPath: path)
			}
		} catch {
			print(error)
		}
	}
	
	func showError(str:String) {
		let alert:NSAlert = NSAlert()
		alert.messageText = "警告⚠️\(str)"
		alert.addButton(withTitle: "好")
		alert.alertStyle = .critical
		
		alert.runModal()
	}
}
