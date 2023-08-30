//
//  CountryDetailView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    var countryData: CountryData
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailRow(number: countryData.confirmed.formatNumber(), name: "Confirmed Cases")
                    .padding(.top)
                
                CountryDetailRow(number: countryData.critical.formatNumber(), name: "Critical Condition", color: .orange)
                
                CountryDetailRow(number: countryData.recovered.formatNumber(), name: "Total Recovered", color: .green)
                
                CountryDetailRowPercentage(number: String(format: "%.2f", countryData.recoveredRate), name: "Recovery Rate", color: .green)
                
                CountryDetailRow(number: countryData.deaths.formatNumber(), name: "Total Deaths", color: .red)
                
                CountryDetailRowPercentage(number: String(format: "%.2f", countryData.fatalityRate), name: "Death Rate", color: .red)
                
            }
            .background(Color("cardBackground"))
            .cornerRadius(8)
            .padding()
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.country)
        .background(Color("background"))
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
