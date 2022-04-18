//
//  CurrencyViewOutput.swift.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation
import UIKit

protocol CurrencyViewOutput  {
    func viewLoaded()
    func dateChanged(date: Date)
    func getCurrencies(completionHandler: @escaping ([CurrencyViewModel]) -> ())
    func getArchiveCurrencies(completionHandler: @escaping ([CurrencyViewModel]) -> ())
}

