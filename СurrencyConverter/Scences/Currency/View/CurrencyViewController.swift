
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController, CurrencyViewInput {
    
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var currencyCollectionView: UICollectionView!
    private let datePicker: UIDatePicker = UIDatePicker()
    
    private enum Constants {
        static let datePickerSize:CGSize = CGSize(width: 0, height: 300)
        static let cellEdgeInsets:UIEdgeInsets  = UIEdgeInsets(top: 10, left: 34, bottom: 24, right: 34)
        static let spacingForCells:CGFloat  = CGFloat(8)
        static let currencyCollectionCellId = "collectionCell"
        static let gapBetweenCells = 8.0
        static let edgeDistance = 24.0
        static let two = 2.0
        static let cellsInRow = 3.0
        static let numberOfItemsInSection = 15

    }
   
    private var data = CurrencyData(name: "RUB", price: "30")
    private var output: CurrencyViewOutput!
    
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
        datePicker.addTarget(self, action: #selector(dataChanged(datePicker:)), for: .valueChanged)
        datePicker.frame.size = Constants.datePickerSize
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
        currencyCollectionView.register(UINib(nibName: "CurrencyCollectionViewCell" , bundle: nil ), forCellWithReuseIdentifier: Constants.currencyCollectionCellId)
        currencyCollectionView.dataSource = self
        currencyCollectionView.delegate = self
    }
}

extension CurrencyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.currencyCollectionCellId, for: indexPath) as? CurrencyCollectionViewCell else { return UICollectionViewCell() }
        cell.setCellParameters()
        cell.setData(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.width - (Constants.gapBetweenCells * Constants.two) + (Constants.edgeDistance * Constants.two) / Constants.cellsInRow 
        let width = height
        return CGSize(width: width, height: height)
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
        return Constants.numberOfItemsInSection
    }
}
