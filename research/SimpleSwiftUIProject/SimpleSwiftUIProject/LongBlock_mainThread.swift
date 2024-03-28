//
//  LongBlock_mainThread.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 28/3/2567 BE.
//

import SwiftUI

struct LongBlock_mainThread: View {
    var body: some View {
        Button("Button") {
            load(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*")!)
        }
    }
}

func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//        DispatchQueue.main.async(execute: <#T##DispatchWorkItem#>)
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    let _ = image
                }
            }
        }
//        }
}
#Preview {
    LongBlock_mainThread()
}
