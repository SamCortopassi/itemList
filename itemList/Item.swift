//
//  Item.swift
//  itemList
//
//  Created by Samantha Cortopassi on 2/28/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adj = ["fluffy", "rusty", "shiny"]
            let nouns = ["bear", "spork", "mac"]
        
            var idx = arc4random_uniform(UInt32(adj.count))
            let randomAdj = adj[Int(idx)]
        
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdj) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumer = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName,
                      serialNumber: randomSerialNumer,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
