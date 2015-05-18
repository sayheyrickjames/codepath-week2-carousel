//
//  TermsViewController.swift
//  week2-homework-carousel
//
//  Created by Rick James! Chatas on 5/17/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit
import WebKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var webViewController: UIWebView!
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView = WKWebView()
        self.view = self.webView
        
        var url = NSURL(string:"https://www.dropbox.com/terms?mobile=1")
        var req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
