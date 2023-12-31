//
//  ViewController.swift
//  ToDoAppCoreData
//
//  Created by Enes Gümüş on 31.12.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var NotlarTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var notlarListesi = [Notlar]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotlarTableView.dataSource = self
        NotlarTableView.delegate = self
        searchBar.delegate = self
        
        _ = viewModel.notlarListesi.subscribe(onNext: { liste in
            self.notlarListesi = liste
            self.NotlarTableView.reloadData()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.notlariYukle()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let not = sender as? Notlar{
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.not = not
            }
        }
    }


}

extension Anasayfa: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoCell
        cell.nameLabel.text = not.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let not = notlarListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: not)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let not = self.notlarListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(not.name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModel.sil(not: not)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}

extension Anasayfa: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            viewModel.notlariYukle()
        }else{
            self.viewModel.ara(aramaKelimesi: searchText)
        }
    }
}
