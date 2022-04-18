//
//  CurrencyRate.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 13.04.2022.
//

import Foundation

struct CurrencyRate: Codable, Hashable {
    let Valute: [String: CurrencyModel]
}
