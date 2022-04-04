//
//  CurrencyPresenter.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
   
    private let formatter: FormatterProtocol
    weak var view: CurrencyViewInput?
    private var selectedDate = Date()
    
    private enum Constants {
       static let dateFormat = "dd.MM.yyyy"
    }
    
    init(formatter: FormatterProtocol, view: CurrencyViewInput ) {
        self.formatter = formatter
        self.view = view
    }
    
    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
    
    func viewLoaded() {
        view?.setupInitialState()
        view?.setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
        view?.setMaxDate(date: selectedDate)
    }
    
    func dateChanged(date: Date) {
        view?.setTextFieldTitle(formatter.formatDate(date: date, format: Constants.dateFormat))
        selectedDate = date
    }
}
