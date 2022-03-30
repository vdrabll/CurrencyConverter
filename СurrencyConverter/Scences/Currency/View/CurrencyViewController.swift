
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
 
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let datePicker: UIDatePicker = UIDatePicker()
    let currencyCollectionCellid: String = "CurrencyCollectionViewCell"
    
    var data = [CurrencyData]()
    var output: CurrencyViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output.viewLoaded()
    }
    
    private func setupPresenter() {
        let presenter = CurrencyPresenter(formatter: FormattingUtils(), view: self)
        self.output = presenter
    }
    
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(changeDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: Constants.datePickerWidth, height: Constants.datePickerHeight)
        datePicker.preferredDatePickerStyle = .wheels
        inputTextField.inputView = datePicker
        
        let gestRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(guertureRecognizer:)))
        
        view.addGestureRecognizer(gestRecognizer) }
    
     @objc private  func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func changeDate(datePicker: UIDatePicker) {
        output.dateChanged(date: datePicker.date)
    }
    
    func setMaxDate( date: Date) {
        datePicker.maximumDate = date
    }
    
    func setTextFieldTitle(_ title: String){
        inputTextField.text = title
    }
    
    func setupInitialState() {
        setupDatePicker()
    }
    
    func setupCollectionView(){
    
        let Nibcell = UINib(nibName: currencyCollectionCellid , bundle: nil)
        collectionView.register(Nibcell, forCellWithReuseIdentifier: currencyCollectionCellid )
        
        for _ in 1...15 {
            let product = CurrencyData()
            product?.currencyName = "RUB" //
            product?.currencyPrice = "30.3"
            data.append(product!)
        }
        collectionView.reloadData()
    }
}

extension CurrencyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCollectionViewCell", for: indexPath) as! CurrencyCollectionViewCell
        let products = data[indexPath.row]
        cell.ticker.text = products.currencyName
        cell.price.text = products.currencyPrice
        cell.layer.cornerRadius = 12.0
        cell.backgroundColor = UIColor(red: 0.948, green: 0.963, blue: 0.986, alpha: 1)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellHeight = view.frame.width - (24*2) + (8*2) / 3
        let cellWidth = cellHeight
        return CGSize(width: cellWidth , height: cellHeight )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10,left: 34,bottom: 24,right: 34)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellData = data[indexPath.row]
        print("\(indexPath.row) - \(String(describing: cellData.currencyName))")
    }
}
