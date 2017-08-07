//
//  ValidationViewController.swift
//  PlayInn App
//
//  Created by Yuvasoft on 5/1/17.
//  Copyright © 2017 Yuvasoft. All rights reserved.
//

import UIKit

class ValidationViewController: UIViewController {

    func ShowAlert(_ msg: String)  {
        
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    func isValidEmail(strEmail:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailCheck.evaluate(with: strEmail)
    }
    func isPhoneNumber(strContactNo:String) -> Bool
    {
        let regex: NSString = "\\+?[0-9]{10,13}"
        let predicate:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
    func isValidAge(strAge:String) -> Bool {
        
        let ageRegEx = "\\d\\d"
        let ageCheck = NSPredicate(format: "SELF MATCHES %@", ageRegEx)
        let result =  ageCheck.evaluate(with: strAge)
        return result
    }

}
