//
//  CurrencyCollectionViewCell.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 29.03.2022.
//

import UIKit
import CloudKit
import SwiftUI

class CurrencyCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var tickerLabel: UILabel!
    @IBOutlet weak var viewInfoButton: UIButton! 
    
    private enum Constants {
        static let radius = 12.0
        static let backgroundColor = UIColor(red: 0.948, green: 0.963, blue: 0.986, alpha: 1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCellParameters()
    }
    
    func setCellParameters() {
        self.layer.cornerRadius = Constants.radius
        self.backgroundColor = Constants.backgroundColor
    }
    
    func setData(currency: CurrencyViewModel) {
        self.priceLabel.text = "\(String(format: "%.2f", currency.price))"
        self.tickerLabel.text = "\(String(describing: currency.ticker))"
    }
}
