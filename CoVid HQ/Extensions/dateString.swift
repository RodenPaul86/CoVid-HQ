//
//  dateString.swift
//  CoVid HQ
//
//  Created by Paul on 4/10/21.
//

import Foundation

extension String {
    func toDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        let date: Date? = dateFormatter.date(from: self)
        return date
    }
}
