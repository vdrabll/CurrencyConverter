//
//  CurrencyPresenter.swift.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: Utils, CurrencyViewOutput {
    
    weak var view: CurrencyViewInput?
    
    func viewLoaded() {
        view?.setDateButtonTitle(getCurrentDate())
    }
    
    func dateButtonTapped() {}
    
    private func getCurrentDate() -> String {
        let today = Date()
        return dataFormat(date: today)
    }
}
