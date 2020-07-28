//
//  ItemDetailsViewaControllerTableViewController.swift
//  Track.
//
//  Created by Christopher Greene on 7/28/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class ItemDetailsViewaControllerTableViewController: UITableViewController {
    
    
    @IBOutlet weak var itemDetailName: UILabel!
    
    
    @IBOutlet weak var itemDetailSku: UILabel!
    
    
    @IBOutlet weak var itemDetailSize: UILabel!
    
    @IBOutlet weak var itemDetailCost: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemDetails = InventoryList.init(name: "", sku: "", size: "", cost: "")
        
        itemDetailName.text = "Test text"
        itemDetailSku.text = itemDetails.sku
        itemDetailSize.text = itemDetails.size
        itemDetailCost.text = itemDetails.cost
        tableView.reloadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
