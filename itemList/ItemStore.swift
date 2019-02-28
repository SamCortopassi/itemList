//
//  ItemStore.swift
//  itemList
//
//  Created by Samantha Cortopassi on 2/28/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
