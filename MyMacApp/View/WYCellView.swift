//
//  WYCellView.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/17.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit
import Kingfisher

class WYCellView: NSTableCellView {
	
	var _item:newsItem?
	
	func setItem(_ item:newsItem) {
		self._item = item
		
		self.myImageV1.kf.setImage(with: URL(string: item.img ?? ""), placeholder: nil, options: nil, progressBlock: nil) { (reslt) in
			
		}
		self.titlLabel.stringValue = item.title ?? ""
		self.sourcesLabel.stringValue = item.source ?? ""
		self.timeLabel.stringValue = item.ptime ?? ""
	}
	
	lazy var titlLabel: NSTextField = {
		let Label = NSTextField()
		Label.drawsBackground = false
		Label.isBordered = false
		Label.isEditable = false
		
		return Label
	}()
	var myImageV1 = NSImageView()
//	var myImageV2 = NSImageView()
//	var myImageV3 = NSImageView()
	
	
	lazy var sourcesLabel: NSTextField = {
		let Label = NSTextField()
		Label.isBordered = false
		Label.isEditable = false
		Label.textColor = .lightGray
		Label.font = NSFont.labelFont(ofSize: 8.0)
		
		return Label
	}()
	
	lazy var timeLabel: NSTextField = {
		let Label = NSTextField()
		Label.isBordered = false
		Label.isEditable = false
		Label.textColor = .lightGray
		Label.font = NSFont.labelFont(ofSize: 8.0)
		
		return Label
	}()
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		print("WYCellView init")
		self.setupView()
	}
	
	func setupView() {
		
		self.addSubview(self.titlLabel)
		self.addSubview(self.myImageV1)
		self.addSubview(self.sourcesLabel)
		self.addSubview(self.timeLabel)
		
		self.myImageV1.snp.makeConstraints { (make) in
			make.top.left.bottom.equalTo(NSEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10))
			make.width.equalTo(self.myImageV1.snp.height).multipliedBy(16.0/9.0)
		}
		
		self.titlLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.myImageV1.snp.right).offset(10)
			make.top.right.equalTo(10)
		}
		
		self.sourcesLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.myImageV1.snp.right).offset(10)
			make.bottom.equalTo(NSEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10))
		}
		
		self.timeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(self.sourcesLabel.snp.right).offset(10)
			make.bottom.equalTo(self.sourcesLabel)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
