//
//  TranslationViewController.swift
//  Baluchon
//
//  Created by Yann Perfy on 06/06/2022.
//

import UIKit

class TranslationViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var translate: UIButton!
    
    @IBOutlet weak var traduction: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        translate.layer.cornerRadius = 20
        traduction.layer.cornerRadius = 10
        
    }
    
    @IBAction func didTapTranslateButton() {
        guard let translatedText = textField1.text else { return }

        toggleActivityIndicator(shown: true)
        TranslationService.shared.getTranslation(q: translatedText) { (success, translation) in
            self.toggleActivityIndicator(shown: false)
            if success, let translation = translation {
                self.updateText(withTranslation: translation)
            } else {
                self.presentAlert()
            }
            
        }
    }
    
    
    private func updateText(withTranslation translation: Translation) {
        self.textField2.text = translation.data.translations.first?.translatedText
       
    }
        
        
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        translate.isHidden = shown
    }

    private func presentAlert() {
        let alertVC =   UIAlertController(title: "error", message: "the translation failed", preferredStyle: .alert )
        alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    
    }
}
