//
//  SearchView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Countries...", text: $searchText)
                .padding()
            
        } // End of HStack
        
        .frame( height: 50)
        .background(Color("cardBackground"))
    }
}
