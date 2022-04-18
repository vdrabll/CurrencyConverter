//
//  CurrencyPresenter.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 19.03.2022.
//

import Foundation
import Alamofire
import SwiftUI

class CurrencyPresenter: CurrencyViewOutput {
 
    private let formatter: FormatterProtocol
    weak var view: CurrencyViewInput?
    private var selectedDate = Date()
    var urlsData: String!
    let cbrAPI = CurrencyData()
    
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
        view?.setTextFieldTitle(getCurrentDate(with: Constants.dateFormat))
        view?.setMaxDate(date: selectedDate)
    }
    
    func dateChanged(date: Date) {
        urlsData = formatter.formatDate(date: date, format: Constants.dateFormat)
        view?.setTextFieldTitle(urlsData)
        selectedDate = date
    }
    
    func getCurrencies(completionHandler: @escaping ([CurrencyViewModel]) -> ()) {
        cbrAPI.getTodayCurrencies { (currenciesRate: CurrencyRate?, error: AFError?) in
            var currencies: [CurrencyViewModel] = []
            currenciesRate?.Valute.forEach({ (key: String, value: CurrencyModel) in
                currencies.append(CurrencyViewModel(
                    ticker: key, name: value.name, price: value.value))
            })
            completionHandler(currencies)
        }
    }
    
    func getArchiveCurrencies(completionHandler: @escaping ([CurrencyViewModel]) -> ()) {
        cbrAPI.getArchiveCurrencyRate(data: urlsData) {
            (currenciesRate: CurrencyRate?, error: AFError? ) in
            var archiveCurrencies: [CurrencyViewModel] = []
            currenciesRate?.Valute.forEach({ (key: String, value: CurrencyModel) in
                archiveCurrencies.append(CurrencyViewModel(
                ticker: key, name: value.name, price: value.value))
            })
            completionHandler(archiveCurrencies)
        }
    }
}
