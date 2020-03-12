//
//  CandleStick.swift
//  MyMacApp
//
//  Created by chiyz on 2020/3/10.
//  Copyright © 2020 chiyz. All rights reserved.
//

import Cocoa

class CandleStick: NSView {
	
	var mostHigh : Double = 1
	var mostLow : Double = 1
	var open : Double = 1
	var close : Double = 1
	
	func setCandleValue(_ mostHigh:Double,mostLow:Double,open:Double,close:Double) {
		self.mostHigh = mostHigh
		self.mostLow = mostLow
		self.open = open
		self.close = close
		setNeedsDisplay(self.visibleRect)
	}
	
	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

		if self.mostHigh == self.mostLow {
			NSColor.gray.set()
			let boardHeight:CGFloat = 5.0
			let rect1 = NSMakeRect(0, dirtyRect.height/2 - boardHeight/2, dirtyRect.width, boardHeight)
			let path = NSBezierPath.init(rect: rect1)
			path.fill()
		} else {
			
			let openY = CGFloat((open - mostLow)/(mostHigh-mostLow)) * dirtyRect.height
			let closeY = CGFloat((close - mostLow)/(mostHigh-mostLow)) * dirtyRect.height
			
			let bodyTop = max(openY, closeY)
			let bodyBottom = min(openY, closeY)
			let lineWidth:CGFloat = 2
			
			self.open > self.close ? NSColor(red: 44.0/255.0, green: 223.0/255.0, blue: 17.0/255.0, alpha: 1).set() : NSColor(red: 255.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1).set()
			
//			let rect1 = NSMakeRect(lineWidth/2, bodyBottom, dirtyRect.width - 3, max(bodyTop - bodyBottom, 3))
			let rect1 = NSMakeRect(lineWidth/2, bodyBottom, dirtyRect.width - 3, bodyTop - bodyBottom)
			let bodyPath = NSBezierPath.init(rect: rect1)
			bodyPath.lineWidth = lineWidth
			bodyPath.stroke()
//			bodyPath.fill()

			let topRect = NSMakeRect(dirtyRect.width/2 - lineWidth/2, bodyTop, lineWidth, dirtyRect.height - bodyTop)
			let topPath = NSBezierPath.init(rect: topRect)
			topPath.fill()
			topPath.lineWidth = lineWidth
			
			let bottomRect = NSMakeRect(dirtyRect.width/2 - lineWidth/2, 0, lineWidth, bodyBottom)
			let bottomPath = NSBezierPath.init(rect: bottomRect)
			bottomPath.fill()
			bottomPath.lineWidth = lineWidth

			print("draw in CandleStick")
			
		}
//		self.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
	
	
	override func mouseDown(with event: NSEvent) {
		print("mouseDown in CandleStick")
	}
	override func mouseUp(with event: NSEvent) {
		print("mouseUp in CandleStick")
	}
	
	override func mouseDragged(with event: NSEvent) {
		let mp = convert(event.locationInWindow, from: nil)
		printView("mouseDragged in CandleStick,\(mp)")
	}
    
}
