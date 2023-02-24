//
//  KnowForViewController.swift
//  TrendingMidias
//
//  Created by Raul de Medeiros on 06/12/22.
//

import UIKit

class KnowForViewController: UIViewController {
    var listMedias : [Media]?
    @IBOutlet var mediaTableView: UITableView!
    
    override func viewDidLoad() {
        print("entrei na know for")
        super.viewDidLoad()
        mediaTableView.delegate = self
        mediaTableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.popToRootViewController(animated: true)
    }
}

