//
//  AnasayfaViewModel.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var nRepo = NotlarDaoRepository()
    var notlarListesi = BehaviorSubject<[Notlar]>(value: [Notlar]())
    
    init() {
        notlarListesi = nRepo.notlarListesi
        
    }
    
    func sil(not:Notlar){
        nRepo.sil(not: not)
    }
    
    func ara(aramaKelimesi:String){
        nRepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func notlariYukle(){
        nRepo.notlariYukle()
    }
}
