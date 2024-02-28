import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text(verbatim: "SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Build an x app for iOS 18 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .foregroundColor(.white)
//                .background(Color.red.matchedGeometryEffect(id: "background", in: namespace))
                .background(
                    Image(uiImage: UIImage(imageLiteralResourceName:  "8623701.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace))
                
                .background(
                    Image(uiImage: UIImage(imageLiteralResourceName:  "Background 5.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace))
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace))
                .padding(20)
            }
            else {
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    Text("Build an iOS app for iOS 18 with custom layouts, animations and ...")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    Text(verbatim: "SwiftUI...")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                }
                .foregroundColor(.black)
//                .background(.blue)
//                .background(Color.blue.matchedGeometryEffect(id: "background", in: namespace))
                .background(
                    Image(uiImage: UIImage(imageLiteralResourceName:  "8623701.png"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace))
                .background(
                    Image(uiImage: UIImage(imageLiteralResourceName:  "Background 5.jpg"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace))
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace))
            }
        }.onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}
//rule of thump
//1 matchedGeo should be use on individual ele styling.
//2. fit you add geometry in wrong position or none of geometry the transition will fall back to default one which is fade in and out transition
