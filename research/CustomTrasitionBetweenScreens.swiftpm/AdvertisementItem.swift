//
//  AdvertisementItem.swift
//  CustomTrasitionBetweenScreens
//
//  Created by Siroratt Suntronsuk on 28/2/2567 BE.
//

import SwiftUI

struct AdvertisementItem: View {
    var namespace: Namespace.ID
//    @Binding var show: Bool
    var body: some View {
        VStack {
            Spacer() //expand for max height
            VStack(alignment: .leading, spacing: 12) {
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
//                .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text(verbatim: "SwiftUI")
                    .font(.largeTitle.weight(.bold))
//                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Build an x app for iOS 18 with custom layouts, animations and ...")
                    .font(.footnote)
//                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 80)
//                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .foregroundColor(.white)
//                .background(Color.red.matchedGeometryEffect(id: "background", in: namespace))
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
//                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

#Preview() {
    @Namespace var namespace
    return AdvertisementItem(namespace: namespace)
}
