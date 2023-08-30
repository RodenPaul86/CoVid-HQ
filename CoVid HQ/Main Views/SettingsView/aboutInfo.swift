//
//  AboutInfo.swift
//  CoVid HQ
//
//  Created by Paul on 4/3/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct aboutInfo: View {
    var appName: String
    var appImage: String
    var description: String
    var color: Color
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                
                Image(appImage).resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Capsule()).clipped()
                
                VStack {
                    
                    Text(appName)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text(description)
                        .font(.body)
                }
                .padding(8)
            }
            .padding(16)
        }
    }
}

struct aboutInfo_Previews: PreviewProvider {
    static var previews: some View {
        aboutInfo(appName: "CoVid HQ", appImage: "coronavirus", description: "Version 0.0.0 (000)", color: .purple)
    }
}
