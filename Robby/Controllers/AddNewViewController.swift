//
//  AddNewViewController.swift
//  Robby
//
//  Created by Michael Worthington on 8/31/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

protocol AddNewSubDelegate {
    func newSub(name: String, description: String, amount: String, period: String, icon: String)
}

class AddNewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var periodTextField: UITextField!
    @IBOutlet weak var iconTextField: UITextField!
    
    var passedInfo: String = ""
    
    var activeTextField: UITextField!
    
    var addNewSubDelegate: AddNewSubDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        amountTextField.delegate = self
        periodTextField.delegate = self
        iconTextField.delegate = self
        print(passedInfo)
    }
    
    // Changes the text field currently being edited to the active teext field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        switch activeTextField {
            case nameTextField:
                nameTextField.becomeFirstResponder()
            case descriptionTextField:
                descriptionTextField.becomeFirstResponder()
            case amountTextField:
                amountTextField.becomeFirstResponder()
            case periodTextField:
                periodTextField.becomeFirstResponder()
            case iconTextField:
                iconTextField.becomeFirstResponder()
          default:
                  return
        }
    }
    
    // Editing is done and everything checks out, keyboard closes, so change the nameTextField text to whatever
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField.text = textField.text  //changing the activeTextField's text to this textField's text
    }
    
    // Runs when user hits the return button from a text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //resigns first responder status (aka: exit textfield)
        textField.endEditing(true)
        textField.resignFirstResponder()
        return true
    }

    @IBAction func addNewSub(_ sender: Any) {
        addNewSubDelegate.newSub(name: nameTextField.text ?? "name", description: descriptionTextField.text ?? "description", amount: amountTextField.text ?? "amount", period: periodTextField.text ?? "period", icon: iconTextField.text ?? "icon")
        self.dismiss(animated: true, completion: nil)
    }
}

