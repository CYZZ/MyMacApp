//
//  TogetherSwiftUIView.swift
//  MyMacApp
//
//  Created by chiyz on 2019/10/29.
//  Copyright © 2019 chiyz. All rights reserved.
//

import SwiftUI

//struct TogetherSwiftUIView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct TogetherSwiftUIView: NSViewRepresentable {

//	func makeNSView() -> NSView {
//		NSView.init(frame: NSRect.init(x: 0, y: 0, width: 200, height: 200))
//	}
	
	func makeNSView(context: NSViewRepresentableContext<TogetherSwiftUIView>) -> TogetherSwiftUIView.NSViewType {
		NSView.init(frame: NSRect.init(x: 0, y: 0, width: 200, height: 200))
	}
	
	func updateNSView(_ nsView: NSView, context: NSViewRepresentableContext<TogetherSwiftUIView>) {
		
	}
}

struct TogetherSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TogetherSwiftUIView()
    }
}
