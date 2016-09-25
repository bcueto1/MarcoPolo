//
//  MenuView.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import UIKit

class MenuView: UIViewController {

    @IBOutlet weak var menuItemButtI: UIButton!
    @IBOutlet weak var menuItemI: UILabel!
    @IBOutlet weak var menuItemButtII: UIButton!
    @IBOutlet weak var menuItemII: UILabel!
    @IBOutlet weak var menuItemButtIII: UIButton!
    @IBOutlet weak var menuItemIII: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var marcoButt: UIButton!
    
    var thisRest: Restaurant!
    var newURL: String!
    
    
    @IBAction func menuButtITap(sender: AnyObject) {
        newURL = thisRest.menuItems[0].recipeURL
    }
    
    @IBAction func menuButtIITap(sender: AnyObject) {
        newURL = thisRest.menuItems[1].recipeURL
    }
    
    
    @IBAction func menuButtIIITap(sender: AnyObject) {
        newURL = thisRest.menuItems[2].recipeURL
    }
    
    @IBAction func marcoButtTap(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantName.text = thisRest.name
        
        menuItemI.text = thisRest.menuItems[0].foodName
        menuItemII.text = thisRest.menuItems[1].foodName
        menuItemIII.text = thisRest.menuItems[2].foodName
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : WebsiteView = segue.destinationViewController as! WebsiteView
        
        DestViewController.thisItemURL = newURL
    }

}
