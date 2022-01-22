////
////  ImagePickerView.swift
////  NewsApp
////
////  Created by Siroratt Suntronsuk on 21/1/2565 BE.
////
//
//import SwiftUI
//
//struct ImagePickerView: View {
//    
//    @State var image: Image? = nil
//    @State var showCaptureImageView = false
//    
//    var body: some View {
//        ZStack {
//          VStack {
//            Button(action: {
//              self.showCaptureImageView.toggle()
//            }) {
//              Text("Choose photos")
//            }
//            image?.resizable()
//              .frame(width: 250, height: 200)
//              .clipShape(Circle())
//              .overlay(Circle().stroke(Color.white, lineWidth: 4))
//              .shadow(radius: 10)
//          }
//          if (showCaptureImageView) {
//            CaptureImageView(isShown: $showCaptureImageView, image: $image)
//          }
//        }
//      }
//}
//
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePickerView()
//    }
//}
