//
//  ViewController.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var restList: [Restaurant] = []
    var randomRest: Restaurant!
    var gersi: Restaurant!
    var yakitoriTaisho: Restaurant!
    var shuJiaoFuzhoueseCuisine: Restaurant!
    var amelie: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    
        createRestaurants()
        
        restList.append(gersi)
        restList.append(yakitoriTaisho)
        restList.append(shuJiaoFuzhoueseCuisine)
        restList.append(amelie)
        
        let random = Int(arc4random_uniform(UInt32(restList.count)))
        randomRest = restList[random]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : RestaurantView = segue.destinationViewController as! RestaurantView
        DestViewController.restaurant = randomRest
        DestViewController.thisRestList = restList
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    func createRestaurants() {
        gersi = Restaurant(restName: "Gersi", typeName: "Italian")
        gersi.addToMenu("Pan Seared Trout", itemURL: "http://www.foodnetwork.com/recipes/anne-burrell/pan-fried-trout-recipe.html")
        gersi.addToMenu("Grilled Skirt Steak", itemURL: "http://abc.go.com/shows/the-chew/recipes/grilled-skirt-steak-and-arugula-salad-marilyn-wright")
        gersi.addToMenu("Risotto with Pear and Gorgonzola", itemURL: "http://www.epicurious.com/recipes/food/views/gorgonzola-and-red-pear-risotto-4598")
        
        yakitoriTaisho = Restaurant(restName: "Yakitori Taisho", typeName: "Japanese")
        yakitoriTaisho.addToMenu("Cheese Roll Katsu Tei", itemURL: "http://sumokitchen.com/JapaneseRecipes/chicken-cheese-katsu/")
        yakitoriTaisho.addToMenu("Tonkatsu Tei", itemURL: "http://norecipes.com/recipe/tonkatsu")
        yakitoriTaisho.addToMenu("Chicken Teriyaki Tei", itemURL: "http://japanesefood.about.com/od/teriyakisauce/r/teriyakichicken.html")
        
        shuJiaoFuzhoueseCuisine = Restaurant(restName: "Shu Jiao Fuzhouese Cuisine", typeName: "Chinese")
        shuJiaoFuzhoueseCuisine.addToMenu("Wonton Soup", itemURL: "http://allrecipes.com/recipe/185519/homemade-wonton-soup/")
        shuJiaoFuzhoueseCuisine.addToMenu("Beef Tripe Soup", itemURL: "http://thewoksoflife.com/2014/11/dim-sum-tripe-stew/")
        shuJiaoFuzhoueseCuisine.addToMenu("Fish Ball Soup", itemURL: "http://www.neehao.co.uk/2014/03/fish-balls-noodle-soup-recipe/")
        
        amelie = Restaurant(restName: "Amelie", typeName: "French")
        amelie.addToMenu("Smoked Salmon and Arugula Salad", itemURL: "http://www.fussfreecooking.com/recipe-categories/meat-recipes/smoked-salmon-avocado-and-rocket-arugula-salad/")
        amelie.addToMenu("Pan-Roasted Brook Trout", itemURL: "http://www.tasteofsouthern.com/pan-fried-brook-trout-recipe/")
        amelie.addToMenu("Gratin de ravioles du Royans", itemURL: "http://foodandpassion.blogspot.com/2009/04/ravioles-du-royans.html")
    }
    


}
