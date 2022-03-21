//
//  Utils.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 21.03.2022.
//

import Foundation

class Utils {
    
     func dataFormat( date : Date ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
