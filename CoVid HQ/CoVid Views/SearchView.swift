//
//  SearchView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
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
