//
//  SettingsViewController.swift
//  w2hw
//
//  Created by Jeff Conniff on 9/11/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func buttonCloseTouchUp(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        scrollView.contentSize = CGSize(width: 320, height: 870)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
