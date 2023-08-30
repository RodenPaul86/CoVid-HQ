//
//  OtherApps.swift
//  CoVid HQ
//
//  Created by Paul on 4/3/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct OtherApps: View {
    var appName: String
    var appImage: String
    var description: String
    var color: Color
    
    var body: some View {
        
        VStack {
            HStack {
                Image(appImage).resizable()
                    .frame(width: 64, height: 64)
                    .cornerRadius(15)
                    .padding(10)
                
                VStack(alignment: .leading) {
                    Text(appName)
                        .font(.headline)
                    
                    Text(description)
                        .font(.body)
                }
            }
            //.padding(5)
        }
    }
}

struct OtherApps_Previews: PreviewProvider {
    static var previews: some View {
        OtherApps(appName: "My app name", appImage: "icon_prolight", description: "description of my app.", color: .purple)
            .previewLayout(.fixed(width: 300, height: 80))
            .padding()
    }
}
