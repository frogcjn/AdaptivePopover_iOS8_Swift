//
//  SchoolListTC.swift
//  AdaptivePopover
//
//  Created by frogcjn on 14/6/8.
//  Copyright (c) 2014 Cao Jiannan. All rights reserved.
//

import UIKit

enum AdaptiveMode{
    case Default
    case LandscapePopover
    case AlwaysPopover
}

class SchoolListTC: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    
    @IBInspectable var popoverOniPhone:Bool = false
    @IBInspectable var popoverOniPhoneLandscape:Bool = true
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        //cancel button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "tapCancel:")
        
        // popover settings
        modalPresentationStyle = .Popover
        popoverPresentationController.delegate = self
        
        self.preferredContentSize = CGSize(width:320,height:100)
    }
    
    func tapCancel(_ : UIBarButtonItem) {
        //tap cancel
        dismissViewControllerAnimated(true, completion:nil);
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        //selected a school
        let schoolName = tableView.cellForRowAtIndexPath(indexPath).textLabel.text
        println("did select school: \(schoolName)")
        dismissViewControllerAnimated(true, completion:nil)
    }

    // popover settings, adaptive for horizontal compact trait
    // #pragma mark - UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyleForPresentationController(PC: UIPresentationController!) -> UIModalPresentationStyle{
        
        //this methods is only called by System when the screen has compact width
        
        //return .None means we still want popover when adaptive on iPhone
        //return .FullScreen means we'll get modal presetaion on iPhone
        
        switch(popoverOniPhone, popoverOniPhoneLandscape){
        case (true, _): // always popover on iPhone
            return .None
            
        case (_, true): // popover only on landscape on iPhone
            let size = PC.presentingViewController.view.frame.size
            if(size.width>320.0){ //landscape
                return .None
            }else{
                return .FullScreen
            }
            
        default: // no popover on iPhone
            return .FullScreen
        }
        

    }
    
    func presentationController(_: UIPresentationController!, viewControllerForAdaptivePresentationStyle _: UIModalPresentationStyle)
         -> UIViewController!{
            return UINavigationController(rootViewController: self)
    }
}
