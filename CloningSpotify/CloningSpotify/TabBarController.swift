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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileSearchView.tabBarItem = UITabBarItem(title: "Playlist Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        viewControllers = [
            UINavigationController(rootViewController: profileSearchView)
        ]
        
        tabBar.tintColor = selectedColor
        
        tabBar.backgroundColor = UIColor(named: "background")
        
    
    }
}
