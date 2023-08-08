//
//  CountryDataRowView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(3)
                .frame(width: 110, alignment: .leading)
            
            //Spacer()
            
            Text(countryData.recovered.formatNumber())
                .font(.subheadline)
                .frame(width: 80, height: 40, alignment: .center)
                .padding(.leading, 5)
                .foregroundColor(.green)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .font(.subheadline)
                .frame(width: 80, height: 40, alignment: .center)
                .foregroundColor(.red)
        }
        //.frame(width: UIScreen.main.bounds.width-20, alignment: .center)
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
