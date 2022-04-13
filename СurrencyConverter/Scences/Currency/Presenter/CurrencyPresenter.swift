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
    var model = CurrencyData()
    private var selectedDate = Date()
    var urlsData: String!

        private enum Constants {
       static let dateFormat = "YYYY-MM-dd"
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
        model.getTodaysCurrencyRate()
    }
    
    func dateChanged(date: Date) {
        urlsData = formatter.formatDate(date: date, format: Constants.dateFormat)
        view?.setTextFieldTitle(urlsData)
        selectedDate = date
        model.getArchiveCurrencyRate(data: urlsData)
        
    }
    
}
