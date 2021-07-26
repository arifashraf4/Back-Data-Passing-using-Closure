//
//  ViewController3.swift
//  Person Back Data Parsing (Closure)
//
//  Created by Arif Ashraf on 20/07/21.
//

import UIKit

class ViewController3: UIViewController {

    var person: Person?
    var arrayIndexPerson: Int?
    var closureVC3: ((Person,Int?) -> ())?
    
    @IBOutlet weak var nameTextFieldVC3: UITextField!
    
    @IBOutlet weak var ageTextFieldVC3: UITextField!
    
    @IBOutlet weak var contactTextFieldVC3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameTextFieldVC3.text = self.person?.name
        self.ageTextFieldVC3.text = self.person?.age
        self.contactTextFieldVC3.text = self.person?.contact
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateButton(){
        guard let updatedPersonName = self.nameTextFieldVC3.text,
              let updatedPersonAge = self.ageTextFieldVC3.text,
              let updatedPersonContact = self.contactTextFieldVC3.text else {
            return
        }
        let updatedPerson = Person(name: updatedPersonName,
                                   age: updatedPersonAge,
                                   contact: updatedPersonContact)
        closureVC3?(updatedPerson, arrayIndexPerson)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = contactTextFieldVC3.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count <= 10
    }
    

}
