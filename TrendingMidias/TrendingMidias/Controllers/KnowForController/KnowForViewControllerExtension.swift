//
//  KnowForViewControllerExtension.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 06/12/22.
//

import UIKit

extension KnowForViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMedias?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaCell
        cell.configLayout(media: listMedias![indexPath.row])
        cell.configView()
        return cell
    }
}

extension KnowForViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listMedias![indexPath.row].mediaType == "movie"{
            let storyboard = UIStoryboard(name: "MovieDetailsScreen", bundle: nil)
            tabBarController?.tabBar.isHidden = true
            print("peguei o click")
            let mediaDetailsViewController = storyboard.instantiateViewController(withIdentifier: "mediaDetailsScreen") as! MovieDetailsViewController
            
            mediaDetailsViewController.media = listMedias![indexPath.row]
            let cell = tableView.cellForRow(at: indexPath) as! MediaCell
            mediaDetailsViewController.view.backgroundColor = cell.view.backgroundColor
            mediaDetailsViewController.view.backgroundColor?.withAlphaComponent(1)
            navigationController?.pushViewController(mediaDetailsViewController, animated: true)
        }else{
            let storyboard = UIStoryboard(name: "TVShowDetailsScreen", bundle: nil)
            tabBarController?.tabBar.isHidden = true
            let mediaDetailsViewController = storyboard.instantiateViewController(withIdentifier: "tvDetailsScreen") as! TVShowsDetailsViewController
            
            mediaDetailsViewController.media = listMedias![indexPath.row]
            let cell = tableView.cellForRow(at: indexPath) as! MediaCell
            mediaDetailsViewController.view.backgroundColor = cell.view.backgroundColor
            mediaDetailsViewController.view.backgroundColor?.withAlphaComponent(1)
            navigationController?.pushViewController(mediaDetailsViewController, animated: true)
        }
    }
}
