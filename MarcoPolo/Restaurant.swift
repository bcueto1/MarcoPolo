//
//  Restaurant.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    private var _name: String
    private var _type: String
    private var _menuItems: [Food]
    
    var name: String {
        get {
            return self._name
        }
        
    }
    
    var type: String {
        get {
            return self._type
        }
    }
    
    var menuItems: [Food] {
        get {
            return self._menuItems
        }
    }
    
    init(restName: String, typeName: String) {
        self._name = restName
        self._type = typeName
        self._menuItems = []
    }
    
    func addToMenu(menuItem: String, itemURL: String) {
        let newFood = Food(food: menuItem, URL: itemURL)
        self._menuItems.append(newFood)
    }
    
    func restFlag() -> UIImage {
        var flag: UIImage?
        if (self._type == "Italian") {
            flag = UIImage(named: "ItalianFlag.png")!
        }
        if (self._type == "French") {
            flag = UIImage(named: "FrenchFlag.png")!
        }
        if (self._type == "Chinese") {
            flag = UIImage(named: "ChineseFlag.png")!
        }
        if (self._type == "Japanese") {
            flag = UIImage(named: "JapaneseFlag.jpg")!
        }
        return flag!
    }
    
}