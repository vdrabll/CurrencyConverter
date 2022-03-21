//
//  CurrencyPresenter.swift.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
    
    weak var view: CurrencyViewInput?
    
    let formatter: FormatterProtocol
    
    enum Constants  {
        static let dateFormat: String = "dd.MM.yyyy"
    }
    
    init (formatter: FormatterProtocol) {
        self.formatter = formatter
    }
    
    func viewLoaded() {
        view?.setDateButtonTitle(getCurrentDate())
    }
    
    func dateButtonTapped() {}
    
    private func getCurrentDate(with format: String = Constants.dateFormat) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
}
