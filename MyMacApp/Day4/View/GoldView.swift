//
//  GoldView.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/5.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa
import SnapKit

class GoldView: NSView {
	var _goldModel : GoldModel?
	var _sildModel : GoldModel?
	/// 按钮的回调事件
	var buttonCallBack:((_ button:NSButton)->())?
	
	/// 设置金模型
	func setGoldModel(_ model:GoldModel) {
		self._goldModel = model
		self.gDetailLabel.stringValue = model.toJSONString() ?? ""
		self.gHighValueLabel.stringValue = "\(model.mostHigh ?? 0)"
		self.gLowValueLabel.stringValue = "\(model.mostLow ?? 0)"
		self.gOpenValueLabel.stringValue = "\(model.open ?? 0)"
		self.gCloseValueLabel.stringValue = "\(model.close ?? 0)"
		
		self.calculateRatio(model.close, silver: self._sildModel?.close)
	}
	/// 设置银模型
	func setSilverModel(_ model:GoldModel) {
		self._sildModel = model
		self.sDetailLabel.stringValue = model.toJSONString() ?? ""
		self.sHighValueLabel.stringValue = "\(model.mostHigh ?? 0)"
		self.sLowValueLabel.stringValue = "\(model.mostLow ?? 0)"
		self.sOpenValueLabel.stringValue = "\(model.open ?? 0)"
		self.sCloseValueLabel.stringValue = "\(model.close ?? 0)"
		
		self.calculateRatio(self._goldModel?.close, silver: model.close)
	}
	
	/// 计算金银比
	func calculateRatio(_ gold:Double?,silver:Double?) {
		guard let goldValue = gold else {
			return
		}
		guard let silverValue = silver else {
			return
		}
		let ratio =  goldValue / silverValue
		self.ratioValueLabel.stringValue = String(format: "%.3f", ratio) // "\(ratio)"
	}

	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		self.setupView()
	}
	
	// 初始化页面布局
	func setupView(){
		self.addSubview(title1Label)
		self.addSubview(gDetailLabel)
		self.addSubview(gHighDescLabel)
		self.addSubview(gLowDescLabel)
		self.addSubview(gOpenDescLabel)
		self.addSubview(gCloseDescLabel)
		self.addSubview(gHighValueLabel)
		self.addSubview(gLowValueLabel)
		self.addSubview(gCloseValueLabel)
		self.addSubview(gOpenValueLabel)
		
		self.addSubview(title2Label)
		self.addSubview(sDetailLabel)
		self.addSubview(sHighDescLabel)
		self.addSubview(sLowDescLabel)
		self.addSubview(sOpenDescLabel)
		self.addSubview(sCloseDescLabel)
		self.addSubview(sHighValueLabel)
		self.addSubview(sLowValueLabel)
		self.addSubview(sCloseValueLabel)
		self.addSubview(sOpenValueLabel)
		
		self.addSubview(refreshButton)
		self.addSubview(hideDetailButton)
		
		self.addSubview(ratioDescLabel)
		self.addSubview(ratioValueLabel)
		
		
		self.gDetailLabel.isHidden = true
		self.sDetailLabel.isHidden = true
		
		self.title1Label.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalToSuperview().offset(10)
		}
		self.gDetailLabel.snp.makeConstraints { (make) in
			make.left.equalTo(title1Label.snp.right).offset(10)
			make.top.equalToSuperview().offset(10)
		}
		self.gHighDescLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(title1Label.snp.bottom).offset(10)
		}
		self.gLowDescLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(gHighDescLabel.snp.bottom).offset(10)
		}
		self.gOpenDescLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(gLowDescLabel.snp.bottom).offset(10)
		}
		self.gCloseDescLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(gOpenDescLabel.snp.bottom).offset(10)
		}
		// 值布局
		self.gHighValueLabel.snp.makeConstraints { (make) in
			make.left.equalTo(gDetailLabel)
			make.top.equalTo(gHighDescLabel)
		}
		self.gLowValueLabel.snp.makeConstraints { (make) in
			make.left.equalTo(gDetailLabel)
			make.top.equalTo(gLowDescLabel)
		}
		self.gOpenValueLabel.snp.makeConstraints { (make) in
			make.left.equalTo(gDetailLabel)
			make.top.equalTo(gOpenDescLabel)
		}
		self.gCloseValueLabel.snp.makeConstraints { (make) in
			make.left.equalTo(gDetailLabel)
			make.top.equalTo(gCloseDescLabel)
		}
		// 开始silver布局
		self.title2Label.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(gCloseDescLabel.snp.bottom).offset(10)
		}
		self.sDetailLabel.snp.makeConstraints { (make) in
			make.left.equalTo(title2Label.snp.right).offset(10)
			make.top.equalTo(title2Label)
		}
		self.sHighDescLabel.snp.makeConstraints { (make) in
			make.top.equalTo(title2Label.snp.bottom).offset(10)
			make.left.equalToSuperview().offset(10)
		}
		self.sLowDescLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sHighDescLabel.snp.bottom).offset(10)
			make.left.equalToSuperview().offset(10)
		}
		self.sOpenDescLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sLowDescLabel.snp.bottom).offset(10)
			make.left.equalToSuperview().offset(10)
		}
		self.sCloseDescLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sOpenDescLabel.snp.bottom).offset(10)
			make.left.equalToSuperview().offset(10)
		}
		// 开始silver值布局
		self.sHighValueLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sHighDescLabel)
			make.left.equalTo(sDetailLabel)
		}
		self.sLowValueLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sLowDescLabel)
			make.left.equalTo(sDetailLabel)
		}
		self.sOpenValueLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sOpenDescLabel)
			make.left.equalTo(sDetailLabel)
		}
		self.sCloseValueLabel.snp.makeConstraints { (make) in
			make.top.equalTo(sCloseDescLabel)
			make.left.equalTo(sDetailLabel)
		}
		
		self.refreshButton.snp.makeConstraints { (make) in
			make.left.bottom.equalTo(NSEdgeInsets.init(top: 0, left: 10, bottom: 10, right: 0))
		}
		self.hideDetailButton.snp.makeConstraints { (make) in
			make.left.equalTo(refreshButton.snp.right).offset(10)
			make.bottom.equalTo(refreshButton)
		}
		
		self.ratioDescLabel.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.top.equalTo(sCloseDescLabel.snp.bottom).offset(20)
		}
		self.ratioValueLabel.snp.makeConstraints { (make) in
			make.left.equalTo(ratioDescLabel.snp.right).offset(10)
			make.top.equalTo(ratioDescLabel)
		}

	}
	
	// 描述1
	lazy var title1Label : NSTextField = {
		self.createNormalLabel("gold详细信息")
	}()
	
	// g最高
	lazy var gHighDescLabel: NSTextField = {
		self.createNormalLabel("gold最高价")
	}()
	/// 最低
	lazy var gLowDescLabel: NSTextField = {
		self.createNormalLabel("gold最低价")
	}()
	/// 开始价
	lazy var gOpenDescLabel: NSTextField = {
		self.createNormalLabel("gold开始价")
	}()
	/// 当前
	lazy var gCloseDescLabel: NSTextField = {
		self.createNormalLabel("gold当前价")
	}()
	
	lazy var gDetailLabel: NSTextField = {
		let label = self.createNormalLabel(nil)
		label.textColor = NSColor.lightGray
//		label.drawsBackground = true
//		label.backgroundColor = NSColor.lightGray
		return label
	}()
	
	// g最高信息
	lazy var gHighValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 最低信息
	lazy var gLowValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 开始信息
	lazy var gOpenValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 当前信息
	lazy var gCloseValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	
	
	//************** 分割线 **********
	// 描述2
	lazy var title2Label : NSTextField = {
		self.createNormalLabel("silver详细信息")
	}()
	
	// g最高
	lazy var sHighDescLabel: NSTextField = {
		self.createNormalLabel("silver最高价")
	}()
	/// 最低
	lazy var sLowDescLabel: NSTextField = {
		self.createNormalLabel("silver最低价")
	}()
	/// 开始价
	lazy var sOpenDescLabel: NSTextField = {
		self.createNormalLabel("silver开始价")
	}()
	/// 当前
	lazy var sCloseDescLabel: NSTextField = {
		self.createNormalLabel("silver当前价")
	}()
	
	lazy var sDetailLabel: NSTextField = {
		let label = self.createNormalLabel(nil)
		label.textColor = NSColor.lightGray
//		label.drawsBackground = true
//		label.backgroundColor = NSColor.lightGray
		return label
	}()
	
	// g最高信息
	lazy var sHighValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 最低信息
	lazy var sLowValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 开始信息
	lazy var sOpenValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	/// 当前信息
	lazy var sCloseValueLabel: NSTextField = {
		self.createNormalLabel(nil)
	}()
	
	/// 比例
	lazy var ratioDescLabel: NSTextField = {
		let label = self.createNormalLabel("金银比：")
		return label
	}()
	/// 实际比值
	lazy var ratioValueLabel: NSTextField = {
		let label = self.createNormalLabel(nil)
		return label
	}()
	
	lazy var refreshButton: NSButton = {
		let button = NSButton()
		button.title = "刷新数据"
	
		button.target = self
		button.action = #selector(freshButtonClick(_:))
		return button
	}()
	
	@objc func freshButtonClick(_ button:NSButton) {
		buttonCallBack?(button)
	}
	
	/// 隐藏详情
	lazy var hideDetailButton: NSButton = {
		let button = NSButton()
		button.title = "显示详情"
	
		button.target = self
		button.action = #selector(hideButtonClick(_:))
		return button
	}()
	
	@objc func hideButtonClick(_ button:NSButton) {
		self.gDetailLabel.isHidden = !self.gDetailLabel.isHidden
		self.sDetailLabel.isHidden = !self.sDetailLabel.isHidden
		if self.gDetailLabel.isHidden != true {
			button.title = "隐藏详情"
		} else {
			button.title = "显示详情"
		}
	}
	

	/// 创建通用的标签
	func createNormalLabel(_ title : String?) -> NSTextField {
		let Label = NSTextField()
		Label.drawsBackground = false
		Label.isBordered = false
		Label.isEditable = false
		Label.stringValue = title ?? ""
		return Label
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
