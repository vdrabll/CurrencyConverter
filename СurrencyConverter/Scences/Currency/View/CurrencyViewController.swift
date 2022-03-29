
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
   
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var output: CurrencyViewOutput!
    let currencyCollectionCellid: String = "CurrencyCollectionViewCell"
    private let datePicker: UIDatePicker = UIDatePicker()
    var data = [CurrencyData]()
   
    
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
        print("vika1")
    
        let Nibcell = UINib(nibName: currencyCollectionCellid , bundle: nil)
        collectionView.register(Nibcell, forCellWithReuseIdentifier: currencyCollectionCellid )
        
        for _ in 1...15 {
            let product = CurrencyData()
            product?.currencyName = "30"
            product?.currencyPrice = "RUB"
            data.append(product!)
        }
        collectionView.reloadData()
    }
    
}

extension CurrencyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("vika")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCollectionViewCell", for: indexPath) as! CurrencyCollectionViewCell
        let products = data[indexPath.row]
        cell.ticker.text = products.currencyName
        cell.price.text = products.currencyPrice
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 8
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 110)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let products = data[indexPath.row]
        print("\(indexPath.row) - \(String(describing: products.currencyName))")
    }
}
