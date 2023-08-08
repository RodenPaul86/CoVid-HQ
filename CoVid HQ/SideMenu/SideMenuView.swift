//
//  SideMenu.swift
//  CoVid HQ
//
//  Created by Paul on 3/26/21.
//

import SwiftUI

struct SideMenuView: View {
    @State var index = 0
    @Binding var isShowing: Bool
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.red]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                SideMenuHeaderView(isShowing: $isShowing)
                    .foregroundColor(.white)
                    .frame(height: 230)
                
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    
                    Button(action: {
                        print("Tapped Button Tag: \(option)")
                        
                    }, label: {
                        SideMenuOptionView(viewModel: option)
                    })
                    
                    
                    /*
                    NavigationLink(
                        destination: SymptomTracker(),
                        label: {
                            SideMenuOptionView(viewModel: option)
                            
                        })
                     */
                    .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
