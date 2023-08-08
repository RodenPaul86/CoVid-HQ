//
//  ContentView.swift
//  CoVid HQ
//
//  Created by Paul on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView { // Add new view here...
            
            RecentView()
                .tabItem {
                    Tab(imageName: "globe", text: "Data")
                }
                .tag(0)
            
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem {
                    Tab(imageName: "map", text: "Maps")
                }
                .tag(1)
            
            NewsView()
                .tabItem {
                    Tab(imageName: "newspaper", text: "News")
                }
                .tag(2)
            
            SettingsTab()
                .tabItem {
                    Tab(imageName: "gear", text: "Settings")
                }
                .tag(3)
            
        } // End of tabView
        //.accentColor(.red)
    }
}


private struct Tab: View {
    
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
