//
//  ToDoRepository.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import Foundation
import CoreData
import RxSwift

class NotlarDaoRepository{
    
    
    
    var notlarListesi = BehaviorSubject<[Notlar]>(value: [Notlar]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(name:String){
        let not = Notlar(context: context)
        not.name = name
    }
    
    func guncelle(not:Notlar,name:String){
        
        not.name = name
        
        
        appDelegate.saveContext()
    }
    
    func sil(not:Notlar){
        
        context.delete(not)
        appDelegate.saveContext()
        
        notlariYukle()
    }
    
    func ara(aramaKelimesi:String){
        
        do{
            let fr = Notlar.fetchRequest()
            
            fr.predicate = NSPredicate(format: "name CONTAINS[c] %@"
                                       , aramaKelimesi)
            let liste = try context.fetch(fr)
            notlarListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func notlariYukle(){
        
        do{
            let liste = try context.fetch(Notlar.fetchRequest())
            notlarListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription)
        }

    }
}
