//
//  ViewController.swift
//  Track.
//
//  Created by Christopher Greene on 5/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var stockArray: [InventoryList] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 60.0
        tableView.reloadData()
        loadData()

        
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("items").appendingPathExtension("json")
        
        guard let data = try? Data(contentsOf: documentURL) else {return}
        let jsonDecoder = JSONDecoder()
        do {
            stockArray = try jsonDecoder.decode(Array<InventoryList>.self, from: data)
            tableView.reloadData()
        } catch {
            print("Error: Could not load data; \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let documentURL = directoryURL.appendingPathComponent("items").appendingPathExtension("json")
        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(stockArray)
        do {
            try data?.write(to: documentURL, options: .noFileProtection)
        } catch {
            print("Error: Could not save data \(error.localizedDescription)")
        }
    }

    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! AddItemTableViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            stockArray[selectedIndexPath.row] = source.item
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: stockArray.count, section: 0)
            stockArray.append(source.item)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
        saveData()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StockTableViewCell
        return cell
        }
    }
