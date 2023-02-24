//
//  PersonScreenViewControllerExtension.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 06/12/22.
//

import UIKit


extension PersonViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    print(listPeople?.results.count ?? 0)
        return listPeople?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        
        cell.configCell(person: (listPeople?.results[indexPath.row])!)
        
        return cell
    }
    
}

extension PersonViewController : JsonDecoderPeopleProtocol {
    func decodePerson(_ brain: JsonDecoderPeople, data: People) {
        DispatchQueue.main.async {
            self.listPeople = data
            self.tableView.reloadData()
        }
    }
    
    func failParse(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, algo deu errado", message: "Houve um erro inesperado, tente novamente em alguns instantes\n \(error.localizedDescription)", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "retornar", style: .cancel))
            print(error)
            print(error.localizedDescription)
            self.present(alert, animated: true)
        }
    }
}

extension PersonViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if listPeople?.results[indexPath.row].knowFor?.count != 0 {
            
            let storyboard = UIStoryboard(name: "KnowForScreen", bundle: nil)
            
            let knowForViewController = storyboard.instantiateViewController(withIdentifier: "knowForStoryboard") as! KnowForViewController
            
            knowForViewController.title = listPeople?.results[indexPath.row].name
            knowForViewController.listMedias = listPeople?.results[indexPath.row].knowFor
            
            self.navigationController?.pushViewController(knowForViewController, animated: true)
        }
    }
}
