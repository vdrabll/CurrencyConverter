
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
   
    @IBOutlet private weak var inputTextField: UITextField!
    
    var output: CurrencyViewOutput
    let datePicker: UIDatePicker
    let currentDate = Date()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output.viewLoaded()
    }
    
    private func setupPresenter() {
        let presenter = CurrencyPresenter(formatter: FormattingUtils(), view: self)
        self.output = presenter
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: Constants.frameWidth, height: Constants.frameHeight)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = currentDate
        inputTextField.text = formatDate(date: currentDate)
    }
    
     @objc private  func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func changeDate(datePicker: UIDatePicker) {
        inputTextField.text = formatDate(date: datePicker.date)
    }

    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        return formatter.string(from: date)
    }
    
    func setTextFieldTitle(_ title: String){
        inputTextField.text = title
    }
    
    func setupInitialState() {
        setupDatePicker()
    }
   
}
