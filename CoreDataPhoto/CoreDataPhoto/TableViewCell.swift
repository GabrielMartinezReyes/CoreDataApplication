//
//  TableViewCell.swift
//  CoreDataPhoto
//
//  Created by Gabriel Martinez on 2018-02-11.
//  Copyright © 2018 Gabriel Martinez. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
