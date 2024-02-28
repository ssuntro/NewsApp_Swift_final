import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            ScrollView {
                if !show {
                    AdvertisementItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation {
                                show.toggle()
                            }
                        }
                }
            }
            
        }
        .coordinateSpace(name: "scroll")
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 70)
        }
        .overlay(Text("Ann"))
        if show {
            AdvertisementView(namespace: namespace, show: $show)
        }
        
        
//        ZStack {
//            if !show {
//                
//            }
//            else {
//                
//                
//            }
//        }.onTapGesture {
//            withAnimation {
//                show.toggle()
//            }
//        }
    }
}
//rule of thump
//1 matchedGeo should be use on individual ele styling.
//2. fit you add geometry in wrong position or none of geometry the transition will fall back to default one which is fade in and out transition
