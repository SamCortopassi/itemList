//
//  itemsVC.swift
//  itemList
//
//  Created by Samantha Cortopassi on 2/28/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class ItemsVC: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
//        create & add new item to store
        let newItem = itemStore.createItem()
        
//          where is it in array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
//              insert new row to table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        if in editing mode
        if isEditing{
            sender.setTitle("Edit", for: .normal)
//            turn off editing mode
            setEditing(false, animated: true)
        } else {
//            change button txt edit->done
            sender.setTitle("Done", for: .normal)
//            enter deiting mode
            setEditing(true, animated: true)
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
//          if table view is asking to commit a delete command
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
//            remove from store
            itemStore.removeItem(item)
            
//            remove row from table
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

