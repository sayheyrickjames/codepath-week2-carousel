//
//  WelcomeViewController.swift
//  week2-homework-carousel
//
//  Created by Rick James! Chatas on 5/13/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var carouselForASpinVIew: UIImageView!
    
    @IBOutlet weak var carouselForASpinSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        if page == 3 {
            delay(0.3, { () -> () in
                UIView.animateWithDuration(0.3, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.carouselForASpinVIew.alpha = 1
                    self.carouselForASpinSwitch.alpha = 1
                    self.pageControl.alpha = 0
                })
            })
            
        } else {
            self.carouselForASpinVIew.alpha = 0
            self.carouselForASpinSwitch.alpha = 0
            self.pageControl.alpha = 1
        }
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
