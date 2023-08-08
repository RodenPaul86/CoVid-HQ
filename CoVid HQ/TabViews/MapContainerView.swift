//
//  MapContainerView.swift
//  CoVid HQ
//
//  Created by Paul on 3/23/21.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
