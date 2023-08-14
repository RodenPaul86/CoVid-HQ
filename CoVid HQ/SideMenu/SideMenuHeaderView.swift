//
//  SideMenuHeaderView.swift
//  CoVid HQ
//
//  Created by Paul on 3/27/21.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                
                withAnimation(.spring()) {
                    isShowing.toggle()
                }
                
            }, label: {
                
                Text("X")
                    .font(.system(size: 25, weight: .semibold))
                    .frame(width: 42, height: 42)
                    .padding()
                
                /*
                Image(systemName: "xmark")
                    .frame(width: 42, height: 42)
                    .padding()
 */
            })
            
            VStack(alignment: .leading) {
                
                Image("coronavirus")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("CoVID HQ")
                    .font(.system(size: 24, weight: .semibold))
                
                Text("Track Covid-19 all over the world.")
                    .font(.system(size: 14))
                    .padding(.bottom, 32)
                
                HStack(spacing: 12) {
                    /*
                    HStack(spacing: 4) {
                        Text("1,000").bold()
                        Text("Following")
                    }
                    
                    HStack(spacing: 4) {
                        Text("600").bold()
                        Text("Followers")
                    }
                    */
                    
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
