//
//  SettingsCell.swift
//  CoVid HQ
//
//  Created by Paul on 4/3/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct SettingsCell: View {
    
    var title: String
    var imgName: String
    var clr: Color
    
    var body: some View {
        
        HStack {
            Image(systemName: imgName)
                .font(.headline)
                .foregroundColor(clr)
            
            Text(title)
                .font(.headline)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(title: "Features", imgName: "sparkle", clr: .purple)
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
