//
//  NewsView.swift
//  CoVid HQ
//
//  Created by Paul on 3/28/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit
import SwiftUIRefresh

struct NewsView: View {
    @ObservedObject var list = getData()
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            List(list.dates) { i in
                NavigationLink(destination: webView(url: i.url)
                    .navigationBarTitle("", displayMode: .inline )) {
                    
                    HStack(spacing: 15) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(i.title)
                                .fontWeight(.heavy)
                                .lineLimit(3)
                                .font(.system(size: 14))
                            
                            Text(i.desc)
                                .lineLimit(2)
                                .font(.system(size: 14))
                            
                            /*
                            let str = "\(i.id)"
                            let dateStr = str.toDate(dateFormat: "yyyy-mm-dd'T'HH:mm:ssZ")
                            
                            Text("\(dateStr!)")
                            */
                        }
                        
                        if i.image != "" {
                            WebImage(url: URL(string: i.image), options: .highPriority, context: nil)
                                .resizable()
                                .frame(width: 110, height: 110)
                                .cornerRadius(20)
                        }
                        
                    }
                    .padding(.vertical, 15)
                }
            }
            .navigationTitle("Health News")
            
            /*
            .pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isShowing = false
                }
            }
            */
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

struct dataType: Identifiable {
    var id: String
    var title: String
    var desc: String
    var url: String
    var image: String
}

class getData: ObservableObject {
    
    @Published var dates = [dataType]()
    
    private let apiKey = " " // <- Add your Rapidapi API Key here.
    private let us = "us"
    private let catHealth = "health"
    
    init() {
        
        let source = "https://newsapi.org/v2/top-headlines?country=\(us)&apiKey=\(apiKey)&category=\(catHealth)"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for i in json["articles"] {
                
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    self.dates.append(dataType(id: id, title: title, desc: description, url: url, image: image))
                }
            }
        }
        .resume()
    }
}

struct webView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
}
