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
    let albumScreen = AlbumScreen()
    
    let screenQueue: UIStoryboard = UIStoryboard(name: "Queue", bundle: nil)
    lazy var storyboardViewController = screenQueue.instantiateInitialViewController() as! StoryboardViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileSearchView.tabBarItem = UITabBarItem(title: "Playlist Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        storyboardViewController.tabBarItem = UITabBarItem(title: "Storyboard", image: UIImage(systemName: "distribute.horizontal.fill"), tag: 1)
        albumScreen.tabBarItem = UITabBarItem(title: "Playlist", image: UIImage(systemName: "music.note"), tag: 2)
        
        viewControllers = [
            UINavigationController(rootViewController: profileSearchView),
            UINavigationController(rootViewController: storyboardViewController),
            UINavigationController(rootViewController: albumScreen)
        ]
        
        tabBar.tintColor = selectedColor
        
        tabBar.backgroundColor = UIColor(named: "background")
        
    
    }
}
