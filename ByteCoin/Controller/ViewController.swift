//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var exchangeRateLabel: UILabel!
    
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loading")
        // Do any additional setup after loading the view.
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

// MARK: - UIPickerViewdelegate
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("did select")
        let selection = coinManager.currencyArray[row]
        print(selection)
        if let coin = coinManager.fetchData(exchangeCurrency: selection) {
            self.didUpdateCoin(currency: coin.currency, rate: coin.rate)
        }
    }
    
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
}

// MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didUpdateCoin(currency: String, rate: Float) {
        DispatchQueue.main.async {
            self.currencyLabel.text = currency
            self.exchangeRateLabel.text = String(format: "$%.2f", rate)            
        }
    }
}
