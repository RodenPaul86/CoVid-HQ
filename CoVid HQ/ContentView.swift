//
//  ContentView.swift
//  CoVid HQ
//
//  Created by Paul on 3/23/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecentView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Data")
                }
            
            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem {
                    Image(systemName: "map")
                    Text("Maps")
                }
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            SettingsTab()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}
