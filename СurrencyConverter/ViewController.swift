
//  ViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//
import UIKit
import Foundation

class ViewController: UIViewController {
    
@IBOutlet weak var dateButton: UIButton!
let today = Date()
let formatter1 = DateFormatter()
var date: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitle()
  }
    
    func setButtonTitle() {
        formatter1.dateStyle = .short
        date = formatter1.string(from: today)
        dateButton.setTitle(date, for: UIControl.State.normal)
        dateButton.titleLabel?.font = UIFont(name: "American Typewriter", size: 24)
    }
}
