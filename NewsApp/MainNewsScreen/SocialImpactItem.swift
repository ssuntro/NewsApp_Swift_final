//
//  SocialImpactItem.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 28/3/2567 BE.
//

import SwiftUI
struct SocialImpactItem: View {
    @State var showingSheet = false
    var body: some View {
        VStack {
            Spacer() //expand for max height
            VStack(alignment: .leading, spacing: 12) {
                Text("Published on March 28th, 2024 at 1:00 PM Bangkok time.".uppercased())
                    .font(.footnote.weight(.semibold))
                Text(verbatim: "Lost Cat")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Kati is a friendly and curious Siamese with striking blue eyes. He/she has a sleek gray coat with white patches")
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
        .frame(width: UIScreen.main.bounds.size.width - 40, height: 220)
        .padding(20)
        .onTapGesture {
            withAnimation {
                showingSheet.toggle()
            }
        }.frame(maxHeight: .infinity)
        .sheet(isPresented: $showingSheet, content: {
            SocialImpactView()
        })
        
    }
}

#Preview {
    SocialImpactItem()
}
