//
//  ViewController.swift
//  CloningSpotify
//
//  Created by Paulo Henrique Costa Alves on 14/05/26.
//

import UIKit
import SwiftUI 
class ViewController: UIViewController {
    let playlistSearch = UIHostingController(rootView: PlaylistSearchView())
    
    @IBOutlet var textFields: [UITextField]!
    
    
    @IBAction func login(_ sender: Any) {
        print("logado")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(playlistSearch)
        
        view.addSubview(playlistSearch.view)
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        playlistSearch.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playlistSearch.view.topAnchor.constraint(equalTo: view.topAnchor),
            playlistSearch.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playlistSearch.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            playlistSearch.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

