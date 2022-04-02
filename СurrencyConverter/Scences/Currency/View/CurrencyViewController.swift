
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
   
    @IBOutlet weak private var inputTextField: UITextField!
    @IBOutlet weak var currencyCollectionView: UICollectionView!
    
    private let datePicker: UIDatePicker = UIDatePicker()
    
    private enum ViewControllerConstants {
        static let currencyCollectionCellid: String = "collectionCell"
        static let datePickerWidth: Int =  0
        static let datePickerHeight: Int = 300
    }
   
    private var data = [CurrencyData]()
    private var output: CurrencyViewOutput!
    private var cell = CurrencyCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        output.viewLoaded()
        data.append(CurrencyData())
    }
    
    private func setupPresenter() {
        let presenter = CurrencyPresenter(formatter: FormattingUtils(), view: self)
        self.output = presenter
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dataChanged(datePicker:)), for: .valueChanged)
        datePicker.frame.size = CGSize(width: ViewControllerConstants.datePickerWidth, height: ViewControllerConstants.datePickerHeight)
        datePicker.preferredDatePickerStyle = .wheels
        inputTextField.inputView = datePicker
        
        let gestRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(guertureRecognizer:)))
        view.addGestureRecognizer(gestRecognizer)
    }
    
    @objc private func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func dataChanged(datePicker: UIDatePicker) {
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
}


extension CurrencyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
   private enum Constants {
        static let cellEdgeInsets: UIEdgeInsets =  UIEdgeInsets(top: 10,left: 34,bottom: 24,right: 34)
        static let spacingForCells: CGFloat = 8
        static let backgroundColor: UIColor = UIColor(red: 0.948, green: 0.963, blue: 0.986, alpha: 1)
        static let radius: Double = 12.0
        static let currencyCollectionCellid: String = "collectionCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = (collectionView.dequeueReusableCell(withReuseIdentifier: Constants.currencyCollectionCellid, for: indexPath) as? CurrencyCollectionViewCell)!
        cell.setData(data: data[indexPath.row])
        cell.backgroundColor = Constants.backgroundColor
        cell.layer.cornerRadius = Constants.radius
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.width - (24 * 2) + (8 * 2) / 3
        let width = height
        return CGSize(width: width , height: height )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.cellEdgeInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spacingForCells
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spacingForCells
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
