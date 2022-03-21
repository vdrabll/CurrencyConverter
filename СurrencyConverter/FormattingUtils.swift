//
//  Utils.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 21.03.2022.
//

import Foundation

class FormattingUtils:  FormatterProtocol  {
    
    func formatDate(date : Date, format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format 
        return dateFormatter.string(from: date)
    }
}
