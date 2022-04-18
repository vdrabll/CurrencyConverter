//
//  CurrencyInfoViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 17.04.2022.
//

import UIKit

class CurrencyInfoViewController: UIViewController {

    @IBOutlet private weak var currencyFullName: UILabel!
    @IBOutlet private weak var rate: UILabel!
    @IBOutlet private weak var currentValue: UILabel!
    
    @IBOutlet private weak var selectedTicker: UILabel!
    @IBOutlet private weak var selectedTickerTextField: UITextField!
    
    @IBOutlet private weak var localCurrencyTicker: UILabel!
    @IBOutlet private weak var localCurrencyTextField: UITextField!
    
    var currency: CurrencyViewModel!=nil
    var userUnput: Double = 0.0
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyFullName.text = currency.name
        rate.text = "Курс"
        currentValue.text = "\(currency.price)"
        
        selectedTicker.text = currency.ticker
        localCurrencyTicker.text = "RUB"
        
        selectedTickerTextField.addTarget(self, action: #selector(updateLocalCurrencyField(_: )), for: .editingChanged)
        
    }
    
    @objc func updateLocalCurrencyField(_ sender: UITextField) {
        let multy = Double(sender.text!)
        if multy != nil {
            localCurrencyTextField.text = "\(caclucLocalCurrency(price: currency.price, multiplier: multy!))"
        }
    }

    
    func caclucLocalCurrency(price: Double, multiplier: Double) -> Double {
        return price * multiplier
    }
}
