
//  CurrencyViewController.swift
//  СurrencyConverter
//
//  Created by Виктория Федосова on 16.03.2022.
//

import UIKit
import Foundation
import SwiftUI

class CurrencyViewController: UIViewController, CurrencyViewInput {
    
    private var uiCells: [CurrencyCollectionViewCell] = []
    private var cellsData: [CurrencyViewModel] = []
    private let datePicker: UIDatePicker = UIDatePicker()
    @IBOutlet private weak var inputDateField: UITextField!
    @IBOutlet private weak var currencyCollectionView: UICollectionView!
    private var currencyPresenter: CurrencyViewOutput!
    
    typealias FinishedDownload = () -> ()
    
    private enum Constants {
        static let datePickerSize: CGSize = CGSize(width: 0, height: 300)
        static let cellEdgeInsets: UIEdgeInsets = UIEdgeInsets(
            top: 10, left: 34, bottom: 24, right: 34)
        static let spacingForCells: CGFloat = CGFloat(8)
        static let currencyCollectionCellId = "collectionCell"
        static let gapBetweenCells = 8.0
        static let edgeDistance = 24.0
        static let cellsInRow = 3.0
    }
   
    override func viewDidLoad() {
        setupPresenter()
        currencyPresenter.viewLoaded()
        currencyPresenter.getCurrencies { currencies in
            self.cellsData = currencies
            super.viewDidLoad()
            self.setupInitialState()
        }
    }
    
    private func setupPresenter() {
        self.currencyPresenter = CurrencyPresenter(formatter: FormattingUtils(), view: self)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dataChanged(datePicker:)), for: .valueChanged)
        datePicker.frame.size = Constants.datePickerSize
        datePicker.preferredDatePickerStyle = .wheels
        inputDateField.inputView = datePicker
        
        let gestRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(guertureRecognizer:)))
        view.addGestureRecognizer(gestRecognizer)
    }
    
    @objc private func viewTapped(guertureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func dataChanged(datePicker: UIDatePicker) {
        currencyPresenter.dateChanged(date: datePicker.date)
        currencyPresenter.getArchiveCurrencies { currencies in
            if !currencies.isEmpty {
                for i in 0...currencies.count - 1 {
                    if self.uiCells.count > i {
                        self.uiCells[i].setData(currency: currencies[i])
                    }
                }
            }
        }
    }
    
    func setMaxDate(date: Date) {
        datePicker.maximumDate = date
    }
    
    func setTextFieldTitle(_ title: String){
        inputDateField.text = title
    }
    
    func setupInitialState() {
        setupDatePicker()
        let uiNib = UINib(nibName: "CurrencyCollectionViewCell" , bundle: nil )
        currencyCollectionView.register(uiNib,
                    forCellWithReuseIdentifier: Constants.currencyCollectionCellId)
        currencyCollectionView.dataSource = self
        currencyCollectionView.delegate = self
        
    }
}

extension CurrencyViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.currencyCollectionCellId, for: indexPath) as? CurrencyCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.setCellParameters()
        cell.setData(currency: cellsData[indexPath.item])
        uiCells.append(cell)
        cell.viewInfoButton.tag = indexPath.item
        cell.viewInfoButton.addTarget(self, action:#selector(self.openInfo(sender:)), for: .touchDown)
        return cell
    }
    
    @objc func openInfo(sender: UIButton ) {
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "CurrencyInfoViewController") as! CurrencyInfoViewController
        nextViewController.currency = self.cellsData[sender.tag]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // todo extract calc height to func
        let height = ( view.frame.width - (Constants.gapBetweenCells * 2.0) + (Constants.edgeDistance * 2.0)) / Constants.cellsInRow
        let width = height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.cellEdgeInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spacingForCells
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spacingForCells
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.cellsData.count
    }
}

