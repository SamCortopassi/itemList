//
//  ItemStore.swift
//  itemList
//
//  Created by Samantha Cortopassi on 2/28/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class ItemStore {
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        //        get ref to obj moved to reinsert
        let movedItem = allItems[fromIndex]
        
        //        remove item from array
        allItems.remove(at: fromIndex)
        
        //        insert new loc
        allItems.insert(movedItem, at: toIndex)
    }

    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    var allItems = [Item]()
    
//    method to change order of items
   
    
    
}
