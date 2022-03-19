//
//  CurrencyPresenter.swift.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
    
    weak var view: CurrencyViewInput?
    
    func viewLoaded() {
        view?.setDateButtonTitle(getCurrentDate())
    }
    
    func dateButtonTapped() {}
    
    private func getCurrentDate() -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: today)
    }
}
