//
//  CurrencyPresenter.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
   
    let formatter: FormatterProtocol
    weak var view: CurrencyViewInput? 
    
    init (formatter: FormatterProtocol, view: CurrencyViewInput ) {
        self.formatter = formatter
        self.view = view
    }
    
    func viewLoaded() {
        view?.setupInitialState()
        view?.setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
    }

    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
}
