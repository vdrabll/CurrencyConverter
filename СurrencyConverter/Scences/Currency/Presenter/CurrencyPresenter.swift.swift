//
//  CurrencyPresenter.swift.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
    
    weak var view: CurrencyViewInput?
    var formatter: FormatterProtocol
    let dateFormat: String = "dd/MM/yyyy"
    
    init (formatter: FormatterProtocol) {
        self.formatter = formatter 
    }
    func viewLoaded() {
        view?.setDateButtonTitle(getCurrentDate(with: dateFormat))
    }
    
    func dateButtonTapped() {}
    
    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
}
