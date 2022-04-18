//
//  CurrencyModel.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 13.04.2022.
//

import Foundation

struct CurrencyModel: Codable, Hashable {
    let id, numCode, charCode: String!
    let nominal: Int!
    let name: String!
    let value, previous: Double!
enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
