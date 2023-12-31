//
//  DetayVC.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import UIKit

class DetayVC: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var not:Notlar?
    var viewModel = DetayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not{
            textField.text = n.name
        }
        
    }
    

    @IBAction func guncelleButton(_ sender: Any) {
        
        if let na = textField.text, let n = not{
            viewModel.guncelle(not: n, name: na)
            
        }
    }
    

}
