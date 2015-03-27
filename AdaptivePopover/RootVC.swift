//
//  RootVC.swift
//  AdaptivePopover
//
//  Created by frogcjn on 14/6/10.
//  Copyright (c) 2014 Cao Jiannan. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    @IBOutlet var popoverOniPhoneSwitch : UISwitch!
    @IBOutlet var popoverOniPhoneLandscapeSwitch : UISwitch!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        switch(segue.identifier){
        case "chooseSchool":
            var schoolListTC = segue.destinationViewController as SchoolListTC
            schoolListTC.popoverOniPhone = popoverOniPhoneSwitch.on
            schoolListTC.popoverOniPhoneLandscape = popoverOniPhoneLandscapeSwitch.on
            break
        default:
            break
        }
    }
}
