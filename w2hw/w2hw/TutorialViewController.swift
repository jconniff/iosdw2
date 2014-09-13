//
//  TutorialViewController.swift
//  w2hw
//
//  Created by Jeff Conniff on 9/10/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate  {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var caroselSpinBtn: UIImageView!
    @IBOutlet weak var caroselSpinBtnClickArea: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("foo")
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        //scrollView.contentInset(top: 0, left: 160, bottom: 0, right: 0)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        if (page == 3) {
            println("last page")
            //caroselSpinBtn.alpha = 1  // this leaves it still clickable, using hidden instead
            caroselSpinBtn.hidden = false // the image
            caroselSpinBtnClickArea.hidden = false            
        }
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
