//
//  CurrencyPresenter.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation
import UIKit

class CurrencyPresenter: CurrencyViewOutput, CurrencyViewInput {
    
    let view: UIView
    let inputTextField: UITextField
    let formatter: FormatterProtocol
    let datePicker: UIDatePicker

    init (formatter: FormatterProtocol, view: UIView, inputTextField: UITextField, datePicker: UIDatePicker) {
        self.formatter = formatter
        self.view = view
        self.inputTextField = inputTextField
        self.datePicker = datePicker
    }
    
    func viewLoaded() {
        setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
    }
    
    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
    
    func setTextFieldTitle(_ title: String) {
        inputTextField.text = title
    }
    
    func setMaxDate() {
        datePicker.maximumDate = Date()
    }
}
