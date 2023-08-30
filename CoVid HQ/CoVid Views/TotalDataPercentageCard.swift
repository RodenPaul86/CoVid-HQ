//
//  TotalDataPercentageCard.swift
//  CoVid HQ
//
//  Created by Paul on 3/23/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct TotalDataPercentageCard: View {
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("\(self.number)%")
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
            .cornerRadius(8.0)
        } // End of geometry
    }
}

struct TotalDataPercentageCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataPercentageCard()
    }
}
