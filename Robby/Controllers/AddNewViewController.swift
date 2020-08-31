//
//  AddNewViewController.swift
//  Robby
//
//  Created by Michael Worthington on 8/31/20.
//  Copyright © 2020 Michael Worthington. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var passedInfo: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        // Do any additional setup after loading the view.
        print("AddNewViewController loaded!")
        print(passedInfo ?? "a nil was passed")
    }
    
    @IBAction func nameTextFieldClicked(_ sender: Any) {
        nameTextField.endEditing(true)
        print("My boy nameTextField was clicked and returned")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameTextField.text = ""
    }

    @IBAction func addNewSub(_ sender: Any) {
        print("sub added")
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
