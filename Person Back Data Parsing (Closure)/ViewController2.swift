//
//  ViewController2.swift
//  Person Back Data Parsing (Closure)
//
//  Created by Arif Ashraf on 20/07/21.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {

    var closureVC2: ((Person) -> ())?
    
    @IBOutlet weak var nameTextFieldVC2: UITextField!
    @IBOutlet weak var ageTextFieldVC2: UITextField!
    @IBOutlet weak var contactTextFieldVC2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ageTextFieldVC2.delegate = self
        contactTextFieldVC2.delegate = self
        
    }
    
    @IBAction func addPersonDataButton(){
        guard let newPersonName = self.nameTextFieldVC2.text,
              let newPersonAge = self.ageTextFieldVC2.text,
              let newPersonContact = self.contactTextFieldVC2.text
        else {
            print("New Person Not Added")
            return }
        let newPerson = Person(name: newPersonName,
                               age: newPersonAge,
                               contact: newPersonContact)
        closureVC2?(newPerson)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = contactTextFieldVC2.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count <= 10
    }
    
}
