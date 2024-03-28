//
//  UIKitView.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 28/3/2567 BE.
//

import SwiftUI

struct UIKitView: UIViewRepresentable { //TextView
    @Binding var text: NSMutableAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}

struct UIKitWrapperView: View {
    @State /*private*/ var text = NSMutableAttributedString(string: "") //no private pitfall

    var body: some View {
        UIKitView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
    }
}

#Preview {
    UIKitWrapperView(text: NSMutableAttributedString(string: "annn"))
//    UIKitWrapperView()
}

