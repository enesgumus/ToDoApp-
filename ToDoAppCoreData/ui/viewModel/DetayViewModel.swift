//
//  DetayViewModel.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import Foundation

class DetayViewModel{
    
    var nRepo = NotlarDaoRepository()
    
    func guncelle(not:Notlar,name:String){
        nRepo.guncelle(not: not, name: name)
    }
}
