//
//  SideMenuOptionView.swift
//  CoVid HQ
//
//  Created by Paul on 3/27/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .about)
    }
}
