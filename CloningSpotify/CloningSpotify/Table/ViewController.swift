//
//  ViewController.swift
//  CloningSpotify
//
//  Created by Paulo Henrique Costa Alves on 14/05/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var footer: UIStackView!
    
    var dataSource = TableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = dataSource
        self.footer.maximumContentSizeCategory = .accessibilityMedium
    }
}

extension ViewController: UITableViewDelegate {
    
}
