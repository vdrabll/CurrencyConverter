//
//  CurrencyViewInput.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

protocol CurrencyViewInput: CurrencyViewController {
    func setTextFieldTitle(_ title: String)
    func setMaxDate()
    
}
