//
//  StockTableViewCell.swift
//  Track.
//
//  Created by Christopher Greene on 5/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemSkuLabel: UILabel!
    @IBOutlet weak var itemSizeLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
