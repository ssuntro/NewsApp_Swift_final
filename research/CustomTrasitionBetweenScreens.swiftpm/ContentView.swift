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
                }
                .foregroundColor(.white)
//                .background(.red)
                .background(Color.red.matchedGeometryEffect(id: "background", in: namespace))
            }
            else {
                VStack {
                    Spacer()
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
                .background(Color.blue.matchedGeometryEffect(id: "background", in: namespace))
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
//2. fit you add geometry in wrong position or none of geometry the transition will fall back to default one which is fade in and out
