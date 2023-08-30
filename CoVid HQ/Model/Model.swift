//
//  Model.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//  Copyright © 2021 Paul Roden Jr. All rights reserved.
//

import Foundation

struct TotalData {
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
    
    var criticalRate: Double {
        return (100.00 * Double(critical)) / Double(confirmed)
    }
}

struct CountryData {
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let latitude: Double
    let longitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
    
    var criticalRate: Double {
        return (100.00 * Double(critical)) / Double(confirmed)
    }
}

let testTotalData = TotalData(confirmed: 0, critical: 0, deaths: 0, recovered: 0)

let testCountryData = CountryData(country: "testDate", confirmed: 0, critical: 0, deaths: 0, recovered: 0, latitude: 0.0, longitude: 0.0)
