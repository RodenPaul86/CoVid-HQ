//
//  TotalDataCard.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                Text(self.number)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .fontWeight(.bold)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
                
            } // End of VStack
            
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(10)
            
        } // End of geometry
        
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
