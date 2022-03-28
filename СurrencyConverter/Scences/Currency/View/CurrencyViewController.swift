
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
   
    @IBOutlet private weak var inputTextField: UITextField!
    
    var output: CurrencyViewOutput!
    private let datePicker: UIDatePicker = UIDatePicker()
    
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
        datePicker.frame.size = CGSize(width: Constants.datePickerWidth, height: Constants.datePickerHeight)
        datePicker.preferredDatePickerStyle = .wheels
        inputTextField.inputView = datePicker
        
        let gestRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(guertureRecognizer:)))
        
        view.addGestureRecognizer(gestRecognizer) }
    
     @objc private  func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func changeDate(datePicker: UIDatePicker) {
        output.dateChanged(date: datePicker.date)
    }
    
    func setMaxDate( date: Date) {
        datePicker.maximumDate = date
    }
    
    func setTextFieldTitle(_ title: String){
        inputTextField.text = title
    }
    
    func setupInitialState() {
        setupDatePicker()
    }

}
