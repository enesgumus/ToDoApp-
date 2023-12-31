//
//  KayitVC.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import UIKit

class KayitVC: UIViewController {

    var viewModel = KayitViewModel()
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

    @IBAction func kaydetButton(_ sender: Any) {
        
        if let na = textField.text {
            viewModel.kaydet(name: na)
        }
    }
    

}
