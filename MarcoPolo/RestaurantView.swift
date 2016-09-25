//
//  RestaurantView.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import UIKit

class RestaurantView: UIViewController {

    @IBOutlet weak var marcoButt: UIButton!
    @IBOutlet weak var marcoLbl: UILabel!
    @IBOutlet weak var poloButt: UIButton!
    @IBOutlet weak var poloLbl: UILabel!
    @IBOutlet weak var restaurantLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var flagImg: UIImageView!
    
    var restaurant: Restaurant!
    var thisRestList: [Restaurant]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantLbl.text = restaurant.name
        typeLbl.text = restaurant.type
        flagImg.image = restaurant.restFlag()
    }
    
    @IBAction func marcoButtTap(sender: AnyObject) {
        var random = Int(arc4random_uniform(UInt32(thisRestList.count)))
        restaurant = thisRestList[random]
        
        restaurantLbl.text = restaurant.name
        typeLbl.text = restaurant.type
        flagImg.image = restaurant.restFlag()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : MenuView = segue.destinationViewController as! MenuView
        
        DestViewController.thisRest = restaurant
    }
}
