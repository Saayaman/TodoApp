//
//  TableViewCell.swift
//  CoreDataToDoApp
//
//  Created by ayako_sayama on 2017-07-28.
//  Copyright © 2017 ayako_sayama. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
