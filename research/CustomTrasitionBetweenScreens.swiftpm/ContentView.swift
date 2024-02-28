import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var showingSheet = false
    
    var body: some View {
        AdvertisementItem(namespace: namespace)
            .onTapGesture {
                withAnimation {
                    showingSheet.toggle()
                }
            }.frame(maxHeight: .infinity)
            .sheet(isPresented: $showingSheet, content: {
                AdvertisementView(namespace: namespace)
            })
            .background(Color.black)
        
        
//        ZStack {
//            Color(.black).ignoresSafeArea()
//            ScrollView {
////                VStack(spacing: 20) {}
//                if !show {
//                    AdvertisementItem(namespace: namespace, show: $show)
//                        .onTapGesture {
//                            withAnimation {
//                                show.toggle()
//                            }
//                        }
//                } else {
//                    AdvertisementView(namespace: namespace, show: $show)
//                }
//            }
//            
//        }
//        .frame(maxHeight: .infinity)
//        .coordinateSpace(name: "scroll")
//        .safeAreaInset(edge: .top) {
//            Color.clear.frame(height: 70)
//        }
//        .overlay(Text("Ann"))
        
        
        
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
//3. only work for start and destination views that contain in same screen
