//
//  RootVC.swift
//  AdaptivePopover
//
//  Created by 曹剑楠 on 14/6/10.
//  Copyright (c) 2014年 Cao Jiannan. All rights reserved.
//

import UIKit

class RootVC: UIViewController {
    @IBOutlet var popOverOniPhoneSwitch : UISwitch
    @IBOutlet var popOverOniPhoneLandscapeSwitch : UISwitch
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch(segue.identifier!){
        case "chooseSchool":
            var schoolListTC = segue.destinationViewController as SchoolListTC
            schoolListTC.popOverOniPhone = popOverOniPhoneSwitch.on
            schoolListTC.popOverOniPhoneLandscape = popOverOniPhoneLandscapeSwitch.on
            break
        default:
            break
        }
    }
}
