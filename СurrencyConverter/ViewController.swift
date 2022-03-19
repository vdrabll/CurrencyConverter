
//  ViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
@IBOutlet private weak var dateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
  }
    
    private func setupInitialState() {
        setupDateButton()
    }
    
    private func setupDateButton() {
        dateButton.setTitle(getCurrentDate(), for: UIControl.State.normal )
    }
    
}

private func getCurrentDate() -> String {
    var currentDate: String
    let today = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    currentDate = dateFormatter.string(from: today)
   return currentDate
}
