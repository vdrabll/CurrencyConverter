//
//  CurrencyCollectionViewCell.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 29.03.2022.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var tickerLable: UILabel!
    
    private enum Constants {
        static let priceLable = "30"
        static let tickerLable = "RUB"
        static let radius = 12.0
        static let backgroundColor = UIColor(red: 0.948, green: 0.963, blue: 0.986, alpha: 1)
    }
    
    
    func setData(data: CurrencyData) {
        priceLable.text = Constants.priceLable
        tickerLable.text = Constants.tickerLable
        self.layer.cornerRadius = Constants.radius
        self.backgroundColor = Constants.backgroundColor
    }
}
