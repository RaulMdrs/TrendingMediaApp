//
//  PersonCell.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 05/12/22.
import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var personProfileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departamentLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var DetailsImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    func configCell(person : Person){
        configLoaderView()
        showLoader()
        configBackgroundView()
        nameLabel.text = person.name
        departamentLabel.text = person.knowForDepartament
        popularityLabel.text = String(person.popularity)
        configImage(person: person)
        if person.knowFor?.count != 0{
            DetailsImage.isHidden = false
        }else{
            DetailsImage.isHidden = true
        }
    }
    
    func configImage(person : Person){
        if person.pathImage != nil {
            guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(person.pathImage ?? "")") else { return }
                DispatchQueue.global().async {
                    guard let firstData = try? Data(contentsOf: url) else { return }
                    DispatchQueue.main.async {
                        self.personProfileImage.image = UIImage(data: firstData)
                        self.personProfileImage.layer.cornerRadius = 50
                        self.personProfileImage.layer.masksToBounds = true
                        self.hideLoader()
                    }
                }
        }else{
            personProfileImage.image = UIImage(systemName: "person.fill")
            personProfileImage.layer.cornerRadius = 20
            personProfileImage.layer.masksToBounds = true
            hideLoader()
        }
    }

    func configBackgroundView()
    {
        backView.layer.cornerRadius = 45
        backView.layer.shadowOpacity = 0.5
        backView.layer.masksToBounds = true
    }
    
    func showLoader(){
        loaderView.isHidden = false
        activityIndicator.startAnimating()
    }
    func hideLoader(){
        loaderView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func configLoaderView(){
        loaderView.layer.cornerRadius = 20.0
        loaderView.layer.masksToBounds = true
    }
}
