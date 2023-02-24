//
//  HomeViewControllerExtension.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 02/12/22.
//

import Foundation
import UIKit


extension MoviesScreenViewController : JsonDecoderProtocol{
    func decodeMedias(_ brain: JsonDecoder, data: Results) {
        listMedias = data
        DispatchQueue.main.async {
            self.mediaTableView.reloadData()
        }
    }
    
    func failParse(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Ops, algo deu errado", message: "Houve um erro inesperado, tente novamente em alguns instantes", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "retornar", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
}

extension MoviesScreenViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tabBarController?.tabBar.isHidden = true
        let storyboard = UIStoryboard(name: "MovieDetailsScreen", bundle: nil)
        
        let mediaDetailsViewController = storyboard.instantiateViewController(withIdentifier: "mediaDetailsScreen") as! MovieDetailsViewController
        
        mediaDetailsViewController.media = listMedias?.results![indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! MediaCell
        mediaDetailsViewController.view.backgroundColor = cell.view.backgroundColor
        mediaDetailsViewController.view.backgroundColor?.withAlphaComponent(1)
        navigationController?.pushViewController(mediaDetailsViewController, animated: true)
    }
}

extension MoviesScreenViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMedias?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaCell
        cell.configView()
        cell.configLayout(media: (listMedias!.results?[indexPath.row])!)
        
        return cell
    }
    
}
