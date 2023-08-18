//
//  CovidFetchRequest.swift
//  CoVid HQ
//
//  Created by Paul on 3/21/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "  " // <- Add your Rapid API Key here.
    ]
    
    init() {
        getAllCountries()
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        AF.request("https://covid-19-data.p.rapidapi.com/totals", headers: headers).responseJSON { response in
            
            let result = response.data
            if result != nil {
                
                let json = JSON(result!)
                //print(json)
                
                let confirmed = json[0]["confirmed"].intValue
                let critical = json[0]["critical"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                //let lastChange = json[0]["lastChange"].intValue
                //let lastUpdate = json[0]["lastUpdate"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries() {
        AF.request("https://covid-19-data.p.rapidapi.com/country/all", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            
            if result != nil {
                
                let dataDictionary = result as! [Dictionary<String,AnyObject>]
                
                for countryData in dataDictionary {
                    //print(countryData)
                    
                    let country = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, latitude: latitude, longitude: longitude)
                    
                    allCount.append(countryObject)
                }
            }
            self.allCountries = allCount.sorted(by: { $0.confirmed > $1.confirmed})
        }
    }
}
