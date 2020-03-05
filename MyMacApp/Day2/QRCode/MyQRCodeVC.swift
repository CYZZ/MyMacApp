//
//  MyQRCodeVC.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/23.
//  Copyright © 2019 chiyz. All rights reserved.
//

import Cocoa
import SnapKit

class MyQRCodeVC: NSViewController {
	
	lazy var imageV: NSImageView = {
		let imageV = NSImageView()
//		imageV.contentTintColor = .lightGray
		return imageV
	}()
	
	lazy var textField: NSTextField = {
		let textField = NSTextField()
		return textField
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		self.setupView()
		DispatchQueue.main.asyncAfter(deadline: .now()+1, execute:{
			self.getPaseBordString()
		})
		
    }
	
	override func loadView() {
		self.view = NSView.init(frame: NSRect.init(x: 0, y: 0, width: 500, height: 500))
	}
	
	/// 获取剪切板的内容
	func getPaseBordString() {
		let pasebord =  NSPasteboard.general
		let data = pasebord.data(forType: .string)
		guard let mydata = data else {
			print("剪切板中没有内容")
			return
		}
		guard let str = String.init(data: mydata, encoding: .utf8) else {
			return
		}
		print("读取到的文字=\(str)")
		
		if str.count > 0 {
			let alert = NSAlert()
			alert.addButton(withTitle: "取消")
			alert.addButton(withTitle: "生成二维码")
			alert.messageText = "提示!"
			// 描述性文字
			alert.informativeText = "剪切板内容：(\(str))"
			
			alert.beginSheetModal(for: self.view.window!) { (responCode) in
				
//				NSButton
				if responCode.rawValue == 1001 {
					// 点击了生成
					let image = self.createQRCodeImage(text: str, WH: 300)
					self.imageV.image = image
					self.textField.stringValue = str
				}
				print("responCode = \(responCode)")
				
			}
			
		}
	}
	
	/// 初始化页面
	func setupView () {
		let button = NSButton()
		button.title = "生成二维码"
		self.view.addSubview(button)
		button.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().inset(20)
		}
		
		button.target = self
		button.action = #selector(buttonClick)
		
		self.view.addSubview(self.textField)
		self.textField.snp.makeConstraints { (make) in
			make.left.equalTo(button.snp.right).inset(-20)
			make.top.equalTo(button)
			make.right.equalToSuperview().inset(20)
		}
		
		self.view.addSubview(self.imageV)
		imageV.snp.makeConstraints { (make) in
			make.top.equalToSuperview().inset(60)
			make.left.equalToSuperview().inset(60)
			make.width.height.equalTo(300)
		}
		
//		self.view.addSubview(MyContentView())
		
	}
	@objc func buttonClick() {
		print("点击了按钮")
		let text = self.textField.stringValue
		
		if text.count > 0 {
			let image = self.createQRCodeImage(text: text, WH: 300)
			self.imageV.image = image
			//		print("二维码 hhh生成的image=\(image)")
		} else {
			let alert = NSAlert()
			alert.addButton(withTitle: "OK")
			alert.messageText = "提示!"
			// 描述性文字
			alert.informativeText = "请在文本框中输入文字"
			
			alert.beginSheetModal(for: self.view.window!) { (responCode) in
				print("responCode = \(responCode)")
			}
		}
		
	}
	
	func createQRCodeImage(text:String,WH:CGFloat) -> NSImage {
		//创建滤镜
		let filter = CIFilter(name: "CIQRCodeGenerator")
		//还原滤镜的默认属性
		filter?.setDefaults()
		//设置需要生成二维码的数据
		filter?.setValue(text.data(using: String.Encoding.utf8), forKey: "inputMessage")
		//从滤镜中取出生成的图片
		let ciImage = filter?.outputImage
		//这个清晰度好
		let bgImage = createNonInterpolatedUIImageFormCIImage(image: ciImage!, size: WH)
		
		return bgImage
	}
	
	func createNonInterpolatedUIImageFormCIImage(image: CIImage, size: CGFloat) -> NSImage {
		
		let extent: CGRect = image.extent.integral
		let scale: CGFloat = min(size/extent.width, size/extent.height)
		
		let width = extent.width * scale
		let height = extent.height * scale
		let cs: CGColorSpace = CGColorSpaceCreateDeviceGray()
		let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 0)!
		
		let context = CIContext(options: nil)
		let bitmapImage: CGImage = context.createCGImage(image, from: extent)!
		
		bitmapRef.interpolationQuality = CGInterpolationQuality.none
		bitmapRef.scaleBy(x: scale, y: scale)
		bitmapRef.draw(bitmapImage, in: extent)
		let scaledImage: CGImage = bitmapRef.makeImage()!
		return NSImage(cgImage: scaledImage, size: NSSize(width: 400, height: 400))
//		return UIImage(cgImage: scaledImage)
	}
	
}

