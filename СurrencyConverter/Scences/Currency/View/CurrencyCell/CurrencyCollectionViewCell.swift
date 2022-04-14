//
//  CurrencyCollectionViewCell.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 29.03.2022.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var tickerLabel: UILabel!
    
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
    
    func setData(data: CurrencyRate) {
//        self.tickerLabel.text = data.Valute.
//        self.priceLabel.text =  "\(data.value)"
    }
}
