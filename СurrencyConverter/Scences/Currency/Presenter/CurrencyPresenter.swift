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
    var datePicker: UIDatePicker?
    let formatter: FormatterProtocol

    init (formatter: FormatterProtocol, view: UIView, inputTextField: UITextField) {
        self.formatter = formatter
        self.view = view
        self.inputTextField = inputTextField
    }
    
    func viewLoaded() {
        setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
        setDatePicker()
        
    }
    
    private func getCurrentDate(with format: String) -> String {
        let today = Date()
        return formatter.formatDate(date: today, format: format)
    }
    
    func setTextFieldTitle(_ title: String) {
        inputTextField.text = title
    }
    
    internal func setDatePicker() {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        inputTextField.inputView = datePicker
        inputTextField.text = formatDate(date: Date())
    }
    
    @objc func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        inputTextField.text = formatDate(date: datePicker.date)
    }
        
    func formatDate(date: Date) -> String
        {
            let formatter = DateFormatter()
            formatter.dateFormat = Constants.dateFormat
            return formatter.string(from: date)
        }
}
