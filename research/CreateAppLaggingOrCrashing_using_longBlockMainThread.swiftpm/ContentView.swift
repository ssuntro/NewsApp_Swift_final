import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageViewWrapper(image: img.image).frame(height: 100) //UIImage
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Button title") {
                print("Button tapped!")
            }
        }
    }
    
    var img: UIImageView {
        let image = UIImageView()
        image.load(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*")!)
        return image
    }
}
//Designated initializers are the primary way to initialize a class(alternative initialise option in V direction)
//convenience initializers offer an additional method(alternative initialise option in H direction)
extension UIImage {
    convenience init?(datasource: Data?) {
        if let datasource = datasource {
            self.init(data: datasource)
        } else {
            return nil
        }
    }
    convenience init?(with data: Data) {
        self.init(data: data)
    }
    
////        swift limitation#1: Make sense since init should not be asyc method
//    convenience init?(with url: URL) {
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: url) {
//                self.init(data: data)
//            } else { return nil }
//        }
//    }
    
////        swift limitation#2
//    convenience init?(with url: URL) {
//        Task {
//            if let data = try? await Data(contentsOf: url) {
//                self.init(data: data)
//            }
//        }
//        return nil
//    }
}

//Objective: ImageViewWrapper === UIImageView
struct ImageViewWrapper: UIViewRepresentable {
    let image: UIImage?

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = image
    }
}

extension UIImageView {
    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
//        }
    }
}

