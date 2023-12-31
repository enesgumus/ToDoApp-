//
//  KayitViewModel.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import Foundation

class KayitViewModel{
    
    var nRepo = NotlarDaoRepository()
    
    func kaydet(name:String){
        nRepo.kaydet(name: name)
    }
}
