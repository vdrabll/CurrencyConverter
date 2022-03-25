
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController {
  
    @IBOutlet weak var inputTextField: UITextField!
    var output: CurrencyViewOutput?
    
    let datePicker: UIDatePicker
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output.viewLoaded()
        setDatePicker()
        
    }
    
    private func setupPresenter() {
        
        let presenter = CurrencyPresenter(formatter: FormattingUtils() as FormatterProtocol)
        output = presenter
        
    }
    
    func setTextFieldTitle(_ title: String) {
        inputTextField.text = title
    }
    
    func setDatePicker() {
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        inputTextField.text = formatDate(date: Date())
    }
    
    @objc func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker) {
        inputTextField.text = formatDate(date: datePicker.date)
    }
        
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        return formatter.string(from: date)
    }
}
