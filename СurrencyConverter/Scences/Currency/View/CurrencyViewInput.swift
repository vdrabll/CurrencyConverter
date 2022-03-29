//
//  CurrencyViewInput.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

protocol CurrencyViewInput: AnyObject {
    func setTextFieldTitle(_ title: String)
    func setMaxDate( date: Date)
    func setupInitialState()
    func setupCollectionView()
}
