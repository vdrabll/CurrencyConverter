//
//  CurrencyCollectionViewCell.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 29.03.2022.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ticker: UILabel!
    
    let data = CurrencyData()
    
    func setData(data: CurrencyData) {
        price.text = data.price
        ticker.text = data.name
    }
}
