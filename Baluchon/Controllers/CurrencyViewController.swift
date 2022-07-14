//
//  CurrencyViewController.swift
//  Baluchon
//
//  Created by Yann Perfy on 06/06/2022.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var convert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        convert.layer.cornerRadius = 20
       
        
    }
    
    @IBAction func didTapConvertButton() {
        guard let amount = textField1.text else { return }

        toggleActivityIndicator(shown: true)
        CurrencyService.shared.getCurrency(amount: amount) { (success, currency) in
            self.toggleActivityIndicator(shown: false)
            if success, let currency = currency {
                self.updateAmount(withCurrency: currency)
            } else {
                self.presentAlert()
            }
            
        }
    }
    
    func findConvertion() {

    }
    
    
    private func updateAmount(withCurrency currency: Currency) {
        self.textField2.text = String(currency.result)
       
    }
        
        
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        convert.isHidden = shown
    }

    private func presentAlert() {
        let alertVC =   UIAlertController(title: "error", message: "the convertion failed", preferredStyle: .alert )
        alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    
    }
}

