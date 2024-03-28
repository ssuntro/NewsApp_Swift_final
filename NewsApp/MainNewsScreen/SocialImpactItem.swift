//
//  SocialImpactItem.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 28/3/2567 BE.
//

import SwiftUI
struct SocialImpactItem: View {
    var body: some View {
        VStack {
            Spacer() //expand for max height
            VStack(alignment: .leading, spacing: 12) {
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                Text(verbatim: "SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Build an x app for iOS 18 with custom layouts, animations and ...")
                    .font(.footnote)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 80)
            )
        }
        .foregroundColor(.white)
        .background(
            Image(uiImage: UIImage(imageLiteralResourceName:  "8623701"))
                .resizable()
                .aspectRatio(contentMode: .fit)
        )
        
        .background(
            Image(uiImage: UIImage(imageLiteralResourceName:  "Background 5.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .frame(width: 350, height: 220)
        .padding(20)
    }
}

#Preview {
    SocialImpactItem()
}
