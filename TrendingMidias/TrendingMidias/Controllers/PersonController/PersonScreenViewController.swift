//
//  PersonViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 05/12/22.
//

import UIKit

class PersonViewController: UIViewController {

    var listPeople : People?
    var jsonParse : JsonDecoderPeople = JsonDecoderPeople()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "People"
        jsonParse.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        jsonParse.requestPeople()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = .systemGreen
        tabBarController?.tabBar.isHidden = false
    }
}
