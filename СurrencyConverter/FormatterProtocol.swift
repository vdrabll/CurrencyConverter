//
//  FormatterProtocol.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 21.03.2022.
//

import Foundation

protocol FormatterProtocol {
    
    func formatDate(date : Date, format: String) -> String 
}
