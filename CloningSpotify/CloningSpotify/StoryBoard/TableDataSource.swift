//
//  TableDataSource.swift
//  CloningSpotify
//
//  Created by Paulo Henrique Costa Alves on 18/05/26.
//

import UIKit

class TableDataSource: NSObject, UITableViewDataSource {
    
    let songs: [(title: String, artist: String)] = [
        ("Troubled Paradise", "Slayyyter"),
        ("Walk Like a Man", "Frankie Valli & The Four Seasons"),
        ("Don't Let Me Down - Remastered 2009", "The Beatles"),
        ("Elenore", "The Turtles"),
        ("Hey Moon", "John Maus"),
        ("home with you", "FKA twigs"),
        ("Mercurial World", "Magdalena Bay"),
        ("Hound Dog", "Elvis Presley")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.titleLabel.text = songs[indexPath.row].title
        cell.artistLabel.text = songs[indexPath.row].artist
        return cell
    }

}
