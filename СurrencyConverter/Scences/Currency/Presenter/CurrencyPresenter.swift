//
//  CurrencyPresenter.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation

class CurrencyPresenter: CurrencyViewOutput {
    
    let formatter: FormatterProtocol
    var view: CurrencyViewInput

    init (formatter: FormatterProtocol, view: CurrencyViewInput ) {
        self.formatter = formatter
        self.view = view
    }
    
    func viewLoaded() {
        setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
    }
    
    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
    
    func setTextFieldTitle(_ title: String) {
        view.inputTextField.text = title
    }

    func setMaxDate() {
        view.datePicker.maximumDate = Date()
    }
}
