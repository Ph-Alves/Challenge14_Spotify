//
//  ViewController.swift
//  CloningSpotify
//
//  Created by Paulo Henrique Costa Alves on 14/05/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = dataSource
        // Do any additional setup after loading the view.
    }
}

