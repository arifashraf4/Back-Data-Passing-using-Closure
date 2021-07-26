//
//  ViewController.swift
//  Person Back Data Parsing (Closure)
//
//  Created by Arif Ashraf on 20/07/21.
//

import UIKit

class ViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var person = [Person]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        person.append(Person(name: "Arif", age: "20", contact: "123"))
        
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        person.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonCell {
            let cell1 = person[indexPath.row]
            
            cell.nameLabel.text = cell1.name
            cell.ageLabel.text = cell1.age
            cell.contactLabel.text = cell1.contact
            return cell
        } else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc3 = self.storyboard?.instantiateViewController(identifier: "ViewController3") as? ViewController3 {
            let selectedPerson = self.person[indexPath.row]
            vc3.person = selectedPerson
            vc3.arrayIndexPerson = indexPath.row
            vc3.closureVC3 = { updatedPerson, arrayIndex in
                self.updatedPersonDate(person: updatedPerson, arrayIndexToUpdate: arrayIndex)
            }
            self.navigationController?.pushViewController(vc3, animated: true)
        }
    }
    
    func updatedPersonDate(person: Person, arrayIndexToUpdate: Int?){
        if let index = arrayIndexToUpdate {
            self.person.remove(at: index)
            self.person.insert(person, at: index)
            let indexPathReload = IndexPath(row: index, section: 0)
            self.tableView.reloadRows(at: [indexPathReload], with: .automatic)
        }else {
            print("Couldnt update data")
        }
    }
    
    @IBAction func addAction() {
        if let vc2 = self.storyboard?.instantiateViewController(identifier: "ViewController2") as? ViewController2 {
            vc2.closureVC2 = { [unowned self] person in
                self.addedPersonData(person: person)
                
                //OR
//                self.person.append(Person)
//                self.tableView.reloadData()
            }
            self.navigationController?.pushViewController(vc2, animated: true)
        }
    }
    
    
    func addedPersonData(person: Person){
        self.person.append(person)
        self.tableView.reloadData()
    }
    
}

