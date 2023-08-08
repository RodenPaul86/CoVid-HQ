//
//  CountryDetailRowPercentage.swift
//  CoVid HQ
//
//  Created by Paul on 3/23/21.
//

import SwiftUI

struct CountryDetailRowPercentage: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text(self.name)
                    .font(.body)
                    .padding(5)
                
                Spacer()
                
                Text("\(self.number)%")
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
                
            } // End of HStack
            
            Divider()
        } // End of VStack
        
        .padding(.leading)
        .padding(.trailing)
    }
    
}

struct CountryDetailRowPercentage_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRowPercentage()
    }
}
