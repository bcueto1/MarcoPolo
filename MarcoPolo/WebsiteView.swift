//
//  WebsiteView.swift
//  MarcoPolo
//
//  Created by Brian Cueto on 9/25/16.
//  Copyright © 2016 Marco_Polo. All rights reserved.
//

import UIKit
import WebKit

class WebsiteView: UIViewController {

    
    @IBOutlet weak var container: UIView!
    var webView: WKWebView!
    @IBOutlet weak var marcoButt: UIButton!
    var thisItemURL: String!
    
    @IBAction func marcoButtTap(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        container.addSubview(webView)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let urlStr = thisItemURL
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        
        webView.loadRequest(request)
    }


}
