//
//  TableViewCell.swift
//  CloningSpotify
//
//  Created by Paulo Henrique Costa Alves on 18/05/26.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
