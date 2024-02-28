//
//  AdvertisementView.swift
//  CustomTrasitionBetweenScreens
//
//  Created by Siroratt Suntronsuk on 28/2/2567 BE.
//

import SwiftUI

struct AdvertisementView: View {
    var namespace: Namespace.ID
//    @Binding var show: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                
                cover
            }
            .background(Color.brown)
            .ignoresSafeArea()
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    dismiss()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .offset(y: -150)
        }
        
        
        
        
//                exmaple of simple tableView
//                ScrollView {
//                    VStack(spacing: 20) {
//                        ForEach(0..<10) {
//                            Text("Item \($0)")
//                                .foregroundStyle(.white)
//                                .font(.largeTitle)
//                                .frame(width: 200, height: 200)
//                                .background(.red)
//                        }
//                    }
//                }
//                .frame(height: 350)
//                ScrollView(.horizontal) {
//                    HStack(spacing: 20) {
//                        ForEach(0..<10) {
//                            Text("Item \($0)")
//                                .foregroundStyle(.white)
//                                .font(.largeTitle)
//                                .frame(width: 200, height: 200)
//                                .background(.red)
//                        }
//                    }
//                }
        
    }
    
    var cover: some View {
        VStack() {
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        
        .frame(height: 500)
        .padding(20)
        .foregroundColor(.black)
//                .background(.blue)
//                .background(Color.blue.matchedGeometryEffect(id: "background", in: namespace))
        .background(
            Image(uiImage: UIImage(imageLiteralResourceName:  "8623701.png"))
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image(uiImage: UIImage(imageLiteralResourceName:  "Background 5.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
//            .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("Build an iOS app for iOS 18 with custom layouts, animations and ...")
                    .font(.footnote)
//                    .matchedGeometryEffect(id: "text", in: namespace)
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
//                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text(verbatim: "SwiftUI...")
                    .font(.largeTitle.weight(.bold))
//                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(8)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    Text("Taught by AnneJa 55")
                        .font(.footnote)
                    
                }
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            .offset(y: 200)
            .padding(20)
        )
    }
}

#Preview {
    @Namespace var namespace
    return AdvertisementView(namespace: namespace)
}
