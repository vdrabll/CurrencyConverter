
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//
import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {

    @IBOutlet private weak var dateButton: UIButton!
    
    var output: CurrencyViewOutput? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output?.viewLoaded()
    }
    
    private func setupPresenter() {
        let presenter = CurrencyPresenter(formatter: FormatterProtocol.self as! FormatterProtocol )
        presenter.view = self
        output = presenter
    }
    
    func setDateButtonTitle(_ title: String) {
        dateButton.setTitle(title, for: .normal)
    }
}
