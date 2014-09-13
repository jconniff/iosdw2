//
//  IntroViewController.swift
//  w2hw
//
//  Created by Jeff Conniff on 9/8/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tileFish: UIImageView!
    @IBOutlet weak var tileCabin: UIImageView!
    @IBOutlet weak var tileNess: UIImageView!
    @IBOutlet weak var tileDeer: UIImageView!
    @IBOutlet weak var tileDad: UIImageView!
    @IBOutlet weak var tileSpot: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1136)
        scrollView.delegate = self
        
        // Transform of collection of tiles to their initial position on load
        transformCollection(1)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        
        var pctOfPg = CGFloat(((568 - scrollView.contentOffset.y) / 568)) // 1 -> 0
        
        transformCollection(pctOfPg)
    }
    
    func transformCollection(percentOfScroll:CGFloat) {
        // Call the transform func for each object
        // with Initial transform arguments and the current percent of scroll
        
        trans(self.tileFish, x:10, y:-400, scale:1.5, rot:(-35), pct:percentOfScroll)
        trans(self.tileDeer, x:70, y:-400, scale:1, rot:(20), pct:percentOfScroll)
        trans(self.tileNess, x:-250, y:-300, scale:1.8, rot:(-5), pct:percentOfScroll)
        trans(self.tileCabin, x:-70, y:-400, scale:0.1, rot:(5), pct:percentOfScroll)
        trans(self.tileSpot, x:10, y:-430, scale:0.8, rot:(-25), pct:percentOfScroll)
        trans(self.tileDad, x:10, y:-380, scale:-0.5, rot:(110), pct:percentOfScroll)
    }
     
    func trans(object: UIImageView, x: CGFloat, y: CGFloat, scale: CGFloat, rot: CGFloat, pct: CGFloat) {
        // Do the transforms
        
        object.transform = CGAffineTransformMakeTranslation((x) * (pct), (y) * (pct))
        object.transform = CGAffineTransformRotate(object.transform, (rot) * (pct) * CGFloat(M_PI / 180))
        object.transform = CGAffineTransformScale(object.transform, (scale) * (pct) + 1, (scale) * (pct) + 1)
        
        // first transform has to be CGA...Make...,
        // then the rest of the transforms are CGAff...(non-make)...
        // and include the previous object.transform as a first argument (start of their transform)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


