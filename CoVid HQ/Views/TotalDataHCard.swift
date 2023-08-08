//
//  TotalDataHCard.swift
//  CoVid HQ
//
//  Created by Paul on 3/24/21.
//

import SwiftUI


struct TotalDataHCard: View {
    
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack {
                
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
                
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                
            } // End of VStack
            
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(10)
            
        } // End of geometry
        
    }
    
}

struct TotalDataHCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataHCard()
    }
}
