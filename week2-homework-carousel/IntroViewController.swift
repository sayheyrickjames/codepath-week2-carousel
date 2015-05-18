//
//  tileViewController.swift
//  week2-homework-carousel
//
//  Created by Rick James! Chatas on 5/12/15.
//  Copyright (c) 2015 SayHey. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tile1View: UIImageView!
    
    @IBOutlet weak var tile2View: UIImageView!
    
    @IBOutlet weak var tile3View: UIImageView!
    
    @IBOutlet weak var tile4View: UIImageView!
    
    @IBOutlet weak var tile5View: UIImageView!
    
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
        
        scrollView.sendSubviewToBack(imageView)
        
        tile1View.transform = CGAffineTransformMakeTranslation(-50, -300)
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(1.1), CGFloat(1.1))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(-1) * M_PI / 180))
        
        tile2View.transform = CGAffineTransformMakeTranslation(60, -290)
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(1.6), CGFloat(1.6))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(-10) * M_PI / 180))
        
        tile3View.transform = CGAffineTransformMakeTranslation(30, -450)
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(1.6), CGFloat(1.6))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(20) * M_PI / 180))
        
        tile4View.transform = CGAffineTransformMakeTranslation(130, -430)
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(1.6), CGFloat(1.6))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(10) * M_PI / 180))
        
        tile5View.transform = CGAffineTransformMakeTranslation(-110, -530)
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(1.8), CGFloat(1.8))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(20) * M_PI / 180))
        
        tile6View.transform = CGAffineTransformMakeTranslation(-60, -530)
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(1.6), CGFloat(1.6))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(-4) * M_PI / 180))

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let scollViewMinMax = -20...562
    let scrollViewMin = -20
    let scrollViewMax = 562
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var scrollViewPosition = Float(scrollView.contentOffset.y)
        
        var tile1y = convertValue(scrollViewPosition, -20, 562, -300, 0)
        var tile1x = convertValue(scrollViewPosition, -20, 562, -50, 0)
        var tile1scale = convertValue(scrollViewPosition, -20, 562, 1.1, 1)
        var tile1rotation = convertValue(scrollViewPosition, -20, 562, -1, 0)
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tile1x), CGFloat(tile1y))
        tile1View.transform = CGAffineTransformScale(tile1View.transform, CGFloat(tile1scale), CGFloat(tile1scale))
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(tile1rotation) * M_PI / 180))
        
        var tile2y = convertValue(scrollViewPosition, -20, 562, -290, 0)
        var tile2x = convertValue(scrollViewPosition, -20, 562, 60, 0)
        var tile2scale = convertValue(scrollViewPosition, -20, 562, 1.6, 1)
        var tile2rotation = convertValue(scrollViewPosition, -20, 562, -10, 0)
        tile2View.transform = CGAffineTransformMakeTranslation(CGFloat(tile2x), CGFloat(tile2y))
        tile2View.transform = CGAffineTransformScale(tile2View.transform, CGFloat(tile2scale), CGFloat(tile2scale))
        tile2View.transform = CGAffineTransformRotate(tile2View.transform, CGFloat(Double(tile2rotation) * M_PI / 180))

        var tile3y = convertValue(scrollViewPosition, -20, 562, -450, 0)
        var tile3x = convertValue(scrollViewPosition, -20, 562, 30, 0)
        var tile3scale = convertValue(scrollViewPosition, -20, 562, 1.6, 1)
        var tile3rotation = convertValue(scrollViewPosition, -20, 562, 20, 0)
        tile3View.transform = CGAffineTransformMakeTranslation(CGFloat(tile3x), CGFloat(tile3y))
        tile3View.transform = CGAffineTransformScale(tile3View.transform, CGFloat(tile3scale), CGFloat(tile3scale))
        tile3View.transform = CGAffineTransformRotate(tile3View.transform, CGFloat(Double(tile3rotation) * M_PI / 180))
        
        var tile4y = convertValue(scrollViewPosition, -20, 562, -430, 1)
        var tile4x = convertValue(scrollViewPosition, -20, 562, 130, 0)
        var tile4scale = convertValue(scrollViewPosition, -20, 562, 1.6, 1)
        var tile4rotation = convertValue(scrollViewPosition, -20, 562, 10, 0)
        tile4View.transform = CGAffineTransformMakeTranslation(CGFloat(tile4x), CGFloat(tile4y))
        tile4View.transform = CGAffineTransformScale(tile4View.transform, CGFloat(tile4scale), CGFloat(tile4scale))
        tile4View.transform = CGAffineTransformRotate(tile4View.transform, CGFloat(Double(tile4rotation) * M_PI / 180))

        var tile5y = convertValue(scrollViewPosition, -20, 562, -530, 1)
        var tile5x = convertValue(scrollViewPosition, -20, 562, -110, 0)
        var tile5scale = convertValue(scrollViewPosition, -20, 562, 1.8, 1)
        var tile5rotation = convertValue(scrollViewPosition, -20, 562, 20, 0)
        tile5View.transform = CGAffineTransformMakeTranslation(CGFloat(tile5x), CGFloat(tile5y))
        tile5View.transform = CGAffineTransformScale(tile5View.transform, CGFloat(tile5scale), CGFloat(tile5scale))
        tile5View.transform = CGAffineTransformRotate(tile5View.transform, CGFloat(Double(tile5rotation) * M_PI / 180))

        var tile6y = convertValue(scrollViewPosition, -20, 562, -530, 0)
        var tile6x = convertValue(scrollViewPosition, -20, 562, -60, 0)
        var tile6scale = convertValue(scrollViewPosition, -20, 562, 1.6, 1)
        var tile6rotation = convertValue(scrollViewPosition, -20, 562, -4, 0)
        tile6View.transform = CGAffineTransformMakeTranslation(CGFloat(tile6x), CGFloat(tile6y))
        tile6View.transform = CGAffineTransformScale(tile6View.transform, CGFloat(tile6scale), CGFloat(tile6scale))
        tile6View.transform = CGAffineTransformRotate(tile6View.transform, CGFloat(Double(tile6rotation) * M_PI / 180))
        
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
