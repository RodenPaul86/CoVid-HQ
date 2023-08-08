//
//  TotalDataView.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        
        VStack {
            
            HStack {
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered", color: .green)
                
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Dead", color: .red)
            } // End of HStack
            
            HStack {
                
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .orange)
                
                TotalDataPercentageCard(number: String(format: "%2.f", totalData.recoveredRate), name: "Recov Rate", color: .green)
                
                TotalDataPercentageCard(number: String(format: "%2.f", totalData.fatalityRate), name: "Death Rate", color: .red)
                
                
            } // End of HStack
            
        } // End of VStack
        .frame(width: UIScreen.main.bounds.width - 20, height: 170, alignment: .center)
        .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
