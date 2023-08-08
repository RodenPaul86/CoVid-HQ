//
//  ListHeaderView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct ListHeaderView: View {
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: .center)
                .padding(.leading, 15)
            
            Spacer()
            
            Text("Recovered")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, height: 40, alignment: .center)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("Deaths")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, height: 40, alignment: .center)
                .padding(.trailing, 15 )
        }
        .background(Color("cardBackground"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
