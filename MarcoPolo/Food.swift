//
//  Food.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import Foundation

class Food {
    
    private var _foodName: String
    private var _recipeURL: String
    
    var foodName: String {
        get {
            return self._foodName
        }
        set (newValue) {
            self._foodName = newValue
        }
    }
    
    var recipeURL: String {
        get {
            return self._recipeURL
        }
        set (newValue) {
            self._recipeURL = newValue
        }
    }
    
    init (food: String, URL: String) {
        self._foodName = food
        self._recipeURL = URL
    }
}