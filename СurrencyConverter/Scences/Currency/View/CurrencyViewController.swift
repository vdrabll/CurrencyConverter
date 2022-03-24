
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output?.viewLoaded()
    }
    
    private func setupPresenter() {
        
        let presenter = CurrencyPresenter(formatter: FormattingUtils() as FormatterProtocol, view: self.view, inputTextField: inputTextField )
        output = presenter
    }
}
