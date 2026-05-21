//
//  TabBar.swift
//  CloningSpotify
//
//  Created by Débora Cristina Silva Ferreira on 20/05/26.
//

import Foundation
import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    let selectedColor = UIColor.white
    let unselectedColor = UIColor.gray
    let profileSearchView = UIHostingController(rootView: PlaylistSearchView())
    let libraryView = UIHostingController(rootView: LibraryView())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileSearchView.tabBarItem = UITabBarItem(title: "Playlist Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        libraryView.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical.fill"), tag: 0)

        // Desativando a navbar padrão no topo das telas, assim elas podem aparecer corretamente no dispositivo
        let searchNav = UINavigationController(rootViewController: profileSearchView)
        searchNav.isNavigationBarHidden = true
        
        let libraryNav = UINavigationController(rootViewController: libraryView)
        libraryNav.isNavigationBarHidden = true
        
        viewControllers = [
            searchNav,
            libraryNav
        ]
        
        tabBar.tintColor = selectedColor
        
        tabBar.backgroundColor = UIColor(named: "background")
        
    
    }
}
