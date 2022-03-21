//
//  Utils.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 21.03.2022.
//

import Foundation

class FormattingUtils: FormatterProtocol  {
    
    let dateFormatter: DateFormatter
    
    init(dateFormatter: DateFormatter = DateFormatter()) {
        self.dateFormatter = dateFormatter
    }
    
    func formatDate(date : Date, format: String) -> String {
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
