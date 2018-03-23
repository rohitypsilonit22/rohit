//
//  CommonUtils.swift
//  Neargramme
//
//  Created by khushboo on 9/12/17.
//  Copyright © 2017 khushboo. All rights reserved.
//

import Foundation
import UIKit

// Storyboard Name
var chatsStoryboard = UIStoryboard.init(name: "Chats", bundle: nil)
var contactsStoryboard = UIStoryboard.init(name: "Contacts", bundle: nil)


var user_device_type :String = "2"
var nsud:UserDefaults =  UserDefaults.standard

//APP URLS
//https://projects.invisionapp.com/share/BRG5FSLNJA3#/screens
//var LoginURL:String = "http://silkyfusion.in/near/webservices/login.php"
//var SignupURL:String = "http://silkyfusion.in/near/webservices/registration.php"
//var SocialLoginURL:String = "http://silkyfusion.in/near/webservices/social_login.php"
//var ForgotPasswordURL : String = "http://silkyfusion.in/near/webservices/forgot_pwd.php"
//var CountryListURL : String = "http://silkyfusion.in/near/webservices/country_list.php"
//var VeriftAccountURL : String = "http://silkyfusion.in/near/webservices/pwd_match.php"
//var ChangePasswordURL : String = "http://silkyfusion.in/near/webservices/changepwd.php"


//SCREEN WIDTH AND HEIGHT

var SCREEN_WIDTH = UIScreen.main.bounds.size.width
var SCREEN_HEIGHT = UIScreen.main.bounds.size.height

var WIDTH_FACTOR = SCREEN_WIDTH/320.0
var HEIGHT_FACTOR = SCREEN_HEIGHT/568.0

var BORDERCOLOR = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0).cgColor
var BORDERWIDTH : CGFloat = 1.0

//UI Colors

var dashboardSliderViewColor = UIColor(red: 6.0/255, green: 55.0/255, blue: 150.0/255, alpha: 1.0)
var dashboardSliderSelectedTitleColor = UIColor(red: 252.0/255, green: 219.0/255, blue: 0.0/255, alpha: 1.0)
var dashboardSubSliderViewColor = UIColor(red: 6.0/255, green: 44.0/255, blue: 117.0/255, alpha: 1.0)
