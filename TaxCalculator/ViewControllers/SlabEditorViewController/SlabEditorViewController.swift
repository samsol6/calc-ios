//
//  SlabEditorViewController.swift
//  TaxCalculator
//
//  Created by user 1 on 03/08/2017.
//  Copyright © 2017 ahmad. All rights reserved.
//

import UIKit

class SlabEditorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!

    //1st
    @IBOutlet weak var lowerLimit1: UITextField!
    @IBOutlet weak var upperLimit1: UITextField!
    @IBOutlet weak var incomeTax1: UITextField!
    @IBOutlet weak var percentage1: UITextField!
    
    //2nd
    @IBOutlet weak var lowerLimit2: UITextField!
    @IBOutlet weak var upperLimit2: UITextField!
    @IBOutlet weak var incomeTax2: UITextField!
    @IBOutlet weak var percentage2: UITextField!
    
    //3rd
    @IBOutlet weak var lowerLimit3: UITextField!
    @IBOutlet weak var upperLimit3: UITextField!
    @IBOutlet weak var incomeTax3: UITextField!
    @IBOutlet weak var percentage3: UITextField!
    
    //4th
    @IBOutlet weak var lowerLimit4: UITextField!
    @IBOutlet weak var upperLimit4: UITextField!
    @IBOutlet weak var incomeTax4: UITextField!
    @IBOutlet weak var percentage4: UITextField!
    
    //5th
    @IBOutlet weak var lowerLimit5: UITextField!
    @IBOutlet weak var upperLimit5: UITextField!
    @IBOutlet weak var incomeTax5: UITextField!
    @IBOutlet weak var percentage5: UITextField!
    
    //6th
    @IBOutlet weak var lowerLimit6: UITextField!
    @IBOutlet weak var upperLimit6: UITextField!
    @IBOutlet weak var incomeTax6: UITextField!
    @IBOutlet weak var percentage6: UITextField!
    
    //7th
    @IBOutlet weak var lowerLimit7: UITextField!
    @IBOutlet weak var upperLimit7: UITextField!
    @IBOutlet weak var incomeTax7: UITextField!
    @IBOutlet weak var percentage7: UITextField!
    
    //8th
    @IBOutlet weak var lowerLimit8: UITextField!
    @IBOutlet weak var upperLimit8: UITextField!
    @IBOutlet weak var incomeTax8: UITextField!
    @IBOutlet weak var percentage8: UITextField!
    
    //9th
    @IBOutlet weak var lowerLimit9: UITextField!
    @IBOutlet weak var upperLimit9: UITextField!
    @IBOutlet weak var incomeTax9: UITextField!
    @IBOutlet weak var percentage9: UITextField!
    
    //10th
    @IBOutlet weak var lowerLimit10: UITextField!
    @IBOutlet weak var upperLimit10: UITextField!
    @IBOutlet weak var incomeTax10: UITextField!
    @IBOutlet weak var percentage10: UITextField!
    
    //11th
    @IBOutlet weak var lowerLimit11: UITextField!
    @IBOutlet weak var upperLimit11: UITextField!
    @IBOutlet weak var incomeTax11: UITextField!
    @IBOutlet weak var percentage11: UITextField!
    
    //12th
    @IBOutlet weak var lowerLimit12: UITextField!
    @IBOutlet weak var upperLimit12: UITextField!
    @IBOutlet weak var incomeTax12: UITextField!
    @IBOutlet weak var percentage12: UITextField!
    
    var activeField: UITextField?
    
//    override func loadView() {
//        if UIDevice().userInterfaceIdiom == .phone {
//            
//            if(UIScreen.main.nativeBounds.height == 480){
////                 self.view = [[NSBundle mainBundle] loadNibNamed:"myXib-5" owner:self options:nil][0];
//                self.view = Bundle.mainBundle.loadNibNamed("SlabEditorViewController_5", owner: self, options: nil)
//            }
//            else if(UIScreen.main.nativeBounds.height == 960){
//                print("iPhone 4 or 4S")
//                let vc = SlabEditorViewController(
//                    nibName: "SlabEditorViewController_5",
//                    bundle: nil)
//                self.present(vc, animated: true, completion: nil)
//                
//                
//            }
//            else if(UIScreen.main.nativeBounds.height == 1136){
//                print("iPhone 5 or 5S or 5C")
//                let vc = SlabEditorViewController(
//                    nibName: "SlabEditorViewController_5",
//                    bundle: nil)
//                self.present(vc, animated: true, completion: nil)
//                
//                
//            }
//            else{
//                print("above iphone 6 and +")
//                let vc = SlabEditorViewController(
//                    nibName: "SlabEditorViewController",
//                    bundle: nil)
//                self.present(vc, animated: true, completion: nil)
//                
//                
//            }
//        }
//
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scrollView.contentSize = CGSize(width: 320, height: 568)
        let tap = UITapGestureRecognizer(target: self, action: #selector
            (tapFunction))
        self.scrollView.addGestureRecognizer(tap)
        
        //register notification
        self.registerForKeyboardNotifications()
        //end

        self.setTextFieldDelegate()
        self.getSlabsValueFromUserDefaults()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    //Mark: UITapGesture method
    func tapFunction(sender:UITapGestureRecognizer){
        self.lowerLimit1.resignFirstResponder(); self.upperLimit1.resignFirstResponder(); self.incomeTax1.resignFirstResponder(); self.percentage1.resignFirstResponder()
        
        self.lowerLimit2.resignFirstResponder(); self.upperLimit2.resignFirstResponder(); self.incomeTax2.resignFirstResponder(); self.percentage2.resignFirstResponder()
        
        self.lowerLimit3.resignFirstResponder(); self.upperLimit3.resignFirstResponder(); self.incomeTax3.resignFirstResponder(); self.percentage3.resignFirstResponder()
        
        self.lowerLimit4.resignFirstResponder(); self.upperLimit4.resignFirstResponder(); self.incomeTax4.resignFirstResponder(); self.percentage4.resignFirstResponder()
        
        self.lowerLimit5.resignFirstResponder(); self.upperLimit5.resignFirstResponder(); self.incomeTax5.resignFirstResponder(); self.percentage5.resignFirstResponder()
        
        self.lowerLimit6.resignFirstResponder(); self.upperLimit6.resignFirstResponder(); self.incomeTax6.resignFirstResponder(); self.percentage6.resignFirstResponder()
        
        self.lowerLimit7.resignFirstResponder(); self.upperLimit7.resignFirstResponder(); self.incomeTax7.resignFirstResponder(); self.percentage7.resignFirstResponder()
        
        self.lowerLimit8.resignFirstResponder(); self.upperLimit8.resignFirstResponder(); self.incomeTax8.resignFirstResponder(); self.percentage8.resignFirstResponder()
        
        self.lowerLimit9.resignFirstResponder(); self.upperLimit9.resignFirstResponder(); self.incomeTax9.resignFirstResponder(); self.percentage9.resignFirstResponder()
        
        self.lowerLimit10.resignFirstResponder(); self.upperLimit10.resignFirstResponder(); self.incomeTax10.resignFirstResponder(); self.percentage10.resignFirstResponder()
        
        self.lowerLimit11.resignFirstResponder(); self.upperLimit11.resignFirstResponder(); self.incomeTax11.resignFirstResponder(); self.percentage11.resignFirstResponder()
        
        self.lowerLimit12.resignFirstResponder(); self.upperLimit12.resignFirstResponder(); self.incomeTax12.resignFirstResponder(); self.percentage12.resignFirstResponder()
        
    }
    //end
    
    //Mark: UITextField delegate functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.lowerLimit1.resignFirstResponder(); self.upperLimit1.resignFirstResponder(); self.incomeTax1.resignFirstResponder(); self.percentage1.resignFirstResponder()
        
        self.lowerLimit2.resignFirstResponder(); self.upperLimit2.resignFirstResponder(); self.incomeTax2.resignFirstResponder(); self.percentage2.resignFirstResponder()
        
        self.lowerLimit3.resignFirstResponder(); self.upperLimit3.resignFirstResponder(); self.incomeTax3.resignFirstResponder(); self.percentage3.resignFirstResponder()
        
        self.lowerLimit4.resignFirstResponder(); self.upperLimit4.resignFirstResponder(); self.incomeTax4.resignFirstResponder(); self.percentage4.resignFirstResponder()
        
        self.lowerLimit5.resignFirstResponder(); self.upperLimit5.resignFirstResponder(); self.incomeTax5.resignFirstResponder(); self.percentage5.resignFirstResponder()
        
        self.lowerLimit6.resignFirstResponder(); self.upperLimit6.resignFirstResponder(); self.incomeTax6.resignFirstResponder(); self.percentage6.resignFirstResponder()
        
        self.lowerLimit7.resignFirstResponder(); self.upperLimit7.resignFirstResponder(); self.incomeTax7.resignFirstResponder(); self.percentage7.resignFirstResponder()
        
        self.lowerLimit8.resignFirstResponder(); self.upperLimit8.resignFirstResponder(); self.incomeTax8.resignFirstResponder(); self.percentage8.resignFirstResponder()
        
        self.lowerLimit9.resignFirstResponder(); self.upperLimit9.resignFirstResponder(); self.incomeTax9.resignFirstResponder(); self.percentage9.resignFirstResponder()
        
        self.lowerLimit10.resignFirstResponder(); self.upperLimit10.resignFirstResponder(); self.incomeTax10.resignFirstResponder(); self.percentage10.resignFirstResponder()
        
        self.lowerLimit11.resignFirstResponder(); self.upperLimit11.resignFirstResponder(); self.incomeTax11.resignFirstResponder(); self.percentage11.resignFirstResponder()
        
        self.lowerLimit12.resignFirstResponder(); self.upperLimit12.resignFirstResponder(); self.incomeTax12.resignFirstResponder(); self.percentage12.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        activeField = nil
    }
    //end
    
    
    //Mark: keyboard methods
    func registerForKeyboardNotifications()
    {
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func deregisterFromKeyboardNotifications()
    {
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification)
    {
        //Need to calculate keyboard exact size due to Apple suggestions
        //        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
        
    }
    
    func keyboardWillBeHidden(notification: NSNotification)
    {
        //Once keyboard disappears, restore original positions
        //apple method
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }

    
//    //Mark: textfield delegate functions
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.isUserInteractionEnabled = true
//        textField.becomeFirstResponder()
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        self.lowerLimit1.resignFirstResponder()
////        self.upperLimit1.resignFirstResponder()
////        self.incomeTax1.resignFirstResponder()
////        self.percentage1.resignFirstResponder()
//        
//        textField.isUserInteractionEnabled = false
//        textField.resignFirstResponder()
//        return true
//    }

    @IBAction func firstEditBtnClicked(_ sender: UIButton) {
        self.lowerLimit1.isUserInteractionEnabled = true
        self.upperLimit1.isUserInteractionEnabled = true
        self.incomeTax1.isUserInteractionEnabled = true
        self.percentage1.isUserInteractionEnabled = true
        self.lowerLimit1.becomeFirstResponder()
    }
    @IBAction func secondEditButtonClicked(_ sender: UIButton) {
        self.lowerLimit2.isUserInteractionEnabled = true
        self.upperLimit2.isUserInteractionEnabled = true
        self.incomeTax2.isUserInteractionEnabled = true
        self.percentage2.isUserInteractionEnabled = true
        self.lowerLimit2.becomeFirstResponder()
    }

    @IBAction func thirdEditBtnClicked(_ sender: UIButton) {
        self.lowerLimit3.isUserInteractionEnabled = true
        self.upperLimit3.isUserInteractionEnabled = true
        self.incomeTax3.isUserInteractionEnabled = true
        self.percentage3.isUserInteractionEnabled = true
        self.lowerLimit3.becomeFirstResponder()
    }
    
    @IBAction func fourthBtnClicked(_ sender: UIButton) {
        self.lowerLimit4.isUserInteractionEnabled = true
        self.upperLimit4.isUserInteractionEnabled = true
        self.incomeTax4.isUserInteractionEnabled = true
        self.percentage4.isUserInteractionEnabled = true
        self.lowerLimit4.becomeFirstResponder()
    }
    
    @IBAction func fifthBtnClicked(_ sender: UIButton) {
        self.lowerLimit5.isUserInteractionEnabled = true
        self.upperLimit5.isUserInteractionEnabled = true
        self.incomeTax5.isUserInteractionEnabled = true
        self.percentage5.isUserInteractionEnabled = true
        self.lowerLimit5.becomeFirstResponder()
    }
    
    @IBAction func sixthBtnClicked(_ sender: UIButton) {
        self.lowerLimit6.isUserInteractionEnabled = true
        self.upperLimit6.isUserInteractionEnabled = true
        self.incomeTax6.isUserInteractionEnabled = true
        self.percentage6.isUserInteractionEnabled = true
        self.lowerLimit6.becomeFirstResponder()
    }
   
    @IBAction func seventhBtnClicked(_ sender: UIButton) {
        self.lowerLimit7.isUserInteractionEnabled = true
        self.upperLimit7.isUserInteractionEnabled = true
        self.incomeTax7.isUserInteractionEnabled = true
        self.percentage7.isUserInteractionEnabled = true
        self.lowerLimit7.becomeFirstResponder()
    }
    
    @IBAction func eighthBtnClicked(_ sender: UIButton) {
        self.lowerLimit8.isUserInteractionEnabled = true
        self.upperLimit8.isUserInteractionEnabled = true
        self.incomeTax8.isUserInteractionEnabled = true
        self.percentage8.isUserInteractionEnabled = true
        self.lowerLimit8.becomeFirstResponder()
    }
    
    @IBAction func ninthBtnClicked(_ sender: UIButton) {
        self.lowerLimit9.isUserInteractionEnabled = true
        self.upperLimit9.isUserInteractionEnabled = true
        self.incomeTax9.isUserInteractionEnabled = true
        self.percentage9.isUserInteractionEnabled = true
        self.lowerLimit9.becomeFirstResponder()
    }
    
    @IBAction func tenthBtnClicked(_ sender: UIButton) {
        self.lowerLimit10.isUserInteractionEnabled = true
        self.upperLimit10.isUserInteractionEnabled = true
        self.incomeTax10.isUserInteractionEnabled = true
        self.percentage10.isUserInteractionEnabled = true
        self.lowerLimit10.becomeFirstResponder()
    }
    
    @IBAction func eleventhBtnClicked(_ sender: UIButton) {
        self.lowerLimit11.isUserInteractionEnabled = true
        self.upperLimit11.isUserInteractionEnabled = true
        self.incomeTax11.isUserInteractionEnabled = true
        self.percentage11.isUserInteractionEnabled = true
        self.lowerLimit11.becomeFirstResponder()
    }
    
    @IBAction func twelvethBtnClicked(_ sender: UIButton) {
        self.lowerLimit12.isUserInteractionEnabled = true
        self.upperLimit12.isUserInteractionEnabled = true
        self.incomeTax12.isUserInteractionEnabled = true
        self.percentage12.isUserInteractionEnabled = true
        self.lowerLimit12.becomeFirstResponder()
    }
    
    
    
    
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Mark: Save slabs info into UserDefaults Function ***********************
    
    func getSlabsValueFromUserDefaults(){
        
        
        if let slabsInfoArray : NSMutableArray = UserDefaults.standard.object(forKey: "slabsInfoArray") as? NSMutableArray{
            print(slabsInfoArray)
            
            //first object
            var dict1 : NSMutableDictionary = (slabsInfoArray.object(at: 0) as? NSMutableDictionary)!
            var lowerLimit1Var = dict1.value(forKey: "lowerLimit") as! Int
            var upperLimit1Var = dict1.value(forKey: "upperLimit") as! Int
            var incomeTax1Var = dict1.value(forKey: "incomeTax") as! Int
            var percentage1Var = dict1.value(forKey: "percentage") as! Double
            


            
            lowerLimit1.text = String(describing: lowerLimit1Var)
            upperLimit1.text = String(describing: upperLimit1Var)
            incomeTax1.text  = String(describing: incomeTax1Var)
            percentage1.text = String(describing: percentage1Var)

            //2nd object
            var dict2 : NSMutableDictionary = (slabsInfoArray.object(at: 1) as? NSMutableDictionary)!
            var lowerLimit2Var = dict2.value(forKey: "lowerLimit") as! Int
            var upperLimit2Var = dict2.value(forKey: "upperLimit") as! Int
            var incomeTax2Var = dict2.value(forKey: "incomeTax") as! Int
            var percentage2Var = dict2.value(forKey: "percentage") as! Double
            
            lowerLimit2.text = String(describing: lowerLimit2Var)
            upperLimit2.text = String(describing: upperLimit2Var)
            incomeTax2.text  = String(describing: incomeTax2Var)
            percentage2.text = String(describing: percentage2Var)
        
            //3rd object
            var dict3 : NSMutableDictionary = (slabsInfoArray.object(at: 2) as? NSMutableDictionary)!
            var lowerLimit3Var = dict3.value(forKey: "lowerLimit") as! Int
            var upperLimit3Var = dict3.value(forKey: "upperLimit") as! Int
            var incomeTax3Var = dict3.value(forKey: "incomeTax") as! Int
            var percentage3Var = dict3.value(forKey: "percentage") as! Double
            
            lowerLimit3.text = String(describing: lowerLimit3Var)
            upperLimit3.text = String(describing: upperLimit3Var)
            incomeTax3.text  = String(describing: incomeTax3Var)
            percentage3.text = String(describing: percentage3Var)
            
            //4th object
            var dict4 : NSMutableDictionary = (slabsInfoArray.object(at: 3) as? NSMutableDictionary)!
            var lowerLimit4Var = dict4.value(forKey: "lowerLimit") as! Int
            var upperLimit4Var = dict4.value(forKey: "upperLimit") as! Int
            var incomeTax4Var = dict4.value(forKey: "incomeTax") as! Int
            var percentage4Var = dict4.value(forKey: "percentage") as! Double
            
            lowerLimit4.text = String(describing: lowerLimit4Var)
            upperLimit4.text = String(describing: upperLimit4Var)
            incomeTax4.text  = String(describing: incomeTax4Var)
            percentage4.text = String(describing: percentage4Var)
            
            //5th object
            var dict5 : NSMutableDictionary = (slabsInfoArray.object(at: 4) as? NSMutableDictionary)!
            var lowerLimit5Var = dict5.value(forKey: "lowerLimit") as! Int
            var upperLimit5Var = dict5.value(forKey: "upperLimit") as! Int
            var incomeTax5Var = dict5.value(forKey: "incomeTax") as! Int
            var percentage5Var = dict5.value(forKey: "percentage") as! Double
            
            lowerLimit5.text = String(describing: lowerLimit5Var)
            upperLimit5.text = String(describing: upperLimit5Var)
            incomeTax5.text  = String(describing: incomeTax5Var)
            percentage5.text = String(describing: percentage5Var)
            
            //6th object
            var dict6 : NSMutableDictionary = (slabsInfoArray.object(at: 5) as? NSMutableDictionary)!
            var lowerLimit6Var = dict6.value(forKey: "lowerLimit") as! Int
            var upperLimit6Var = dict6.value(forKey: "upperLimit") as! Int
            var incomeTax6Var = dict6.value(forKey: "incomeTax") as! Int
            var percentage6Var = dict6.value(forKey: "percentage") as! Double
            
            lowerLimit6.text = String(describing: lowerLimit6Var)
            upperLimit6.text = String(describing: upperLimit6Var)
            incomeTax6.text  = String(describing: incomeTax6Var)
            percentage6.text = String(describing: percentage6Var)
            
            //7th object
            var dict7 : NSMutableDictionary = (slabsInfoArray.object(at: 6) as? NSMutableDictionary)!
            var lowerLimit7Var = dict7.value(forKey: "lowerLimit") as! Int
            var upperLimit7Var = dict7.value(forKey: "upperLimit") as! Int
            var incomeTax7Var = dict7.value(forKey: "incomeTax") as! Int
            var percentage7Var = dict7.value(forKey: "percentage") as! Double
            
            lowerLimit7.text = String(describing: lowerLimit7Var)
            upperLimit7.text = String(describing: upperLimit7Var)
            incomeTax7.text  = String(describing: incomeTax7Var)
            percentage7.text = String(describing: percentage7Var)
            
            //8th object
            var dict8 : NSMutableDictionary = (slabsInfoArray.object(at: 7) as? NSMutableDictionary)!
            var lowerLimit8Var = dict8.value(forKey: "lowerLimit") as! Int
            var upperLimit8Var = dict8.value(forKey: "upperLimit") as! Int
            var incomeTax8Var = dict8.value(forKey: "incomeTax") as! Int
            var percentage8Var = dict8.value(forKey: "percentage") as! Double
            
            lowerLimit8.text = String(describing: lowerLimit8Var)
            upperLimit8.text = String(describing: upperLimit8Var)
            incomeTax8.text  = String(describing: incomeTax8Var)
            percentage8.text = String(describing: percentage8Var)
            
            //9th object
            var dict9 : NSMutableDictionary = (slabsInfoArray.object(at: 8) as? NSMutableDictionary)!
            var lowerLimit9Var = dict9.value(forKey: "lowerLimit") as! Int
            var upperLimit9Var = dict9.value(forKey: "upperLimit") as! Int
            var incomeTax9Var = dict9.value(forKey: "incomeTax") as! Int
            var percentage9Var = dict9.value(forKey: "percentage") as! Double
            
            lowerLimit9.text = String(describing: lowerLimit9Var)
            upperLimit9.text = String(describing: upperLimit9Var)
            incomeTax9.text  = String(describing: incomeTax9Var)
            percentage9.text = String(describing: percentage9Var)
            
            //10th object
            var dict10 : NSMutableDictionary = (slabsInfoArray.object(at: 9) as? NSMutableDictionary)!
            var lowerLimit10Var = dict10.value(forKey: "lowerLimit") as! Int
            var upperLimit10ar = dict10.value(forKey: "upperLimit") as! Int
            var incomeTax10Var = dict10.value(forKey: "incomeTax") as! Int
            var percentage10Var = dict10.value(forKey: "percentage") as! Double
            
            lowerLimit10.text = String(describing: lowerLimit10Var)
            upperLimit10.text = String(describing: upperLimit10ar)
            incomeTax10.text  = String(describing: incomeTax10Var)
            percentage10.text = String(describing: percentage10Var)

            //11th object
            var dict11 : NSMutableDictionary = (slabsInfoArray.object(at: 10) as? NSMutableDictionary)!
            var lowerLimit11Var = dict11.value(forKey: "lowerLimit") as! Int
            var upperLimit11Var = dict11.value(forKey: "upperLimit") as! Int
            var incomeTax11Var = dict11.value(forKey: "incomeTax") as! Int
            var percentage11Var = dict11.value(forKey: "percentage") as! Double
            
            lowerLimit11.text = String(describing: lowerLimit11Var)
            upperLimit11.text = String(describing: upperLimit11Var)
            incomeTax11.text  = String(describing: incomeTax11Var)
            percentage11.text = String(describing: percentage11Var)

            //12th object
            var dict12 : NSMutableDictionary = (slabsInfoArray.object(at: 11) as? NSMutableDictionary)!
            var lowerLimit12Var = dict12.value(forKey: "lowerLimit") as! Int
            var upperLimit12Var = dict12.value(forKey: "upperLimit") as! Int
            var incomeTax12Var = dict12.value(forKey: "incomeTax") as! Int
            var percentage12Var = dict12.value(forKey: "percentage") as! Double
            lowerLimit12.text = String(describing: lowerLimit12Var)
            
            upperLimit12.text = String(describing: upperLimit12Var)
            incomeTax12.text  = String(describing: incomeTax12Var)
            percentage12.text = String(describing: percentage12Var)

            
        }
        
        //end...
    }
    
    //End ********************************************************************
    
    
    //Mark: Save info click mehod ********************************************
    @IBAction func saveInfoClicked(_ sender: UIButton) {
        
        self.lowerLimit1.resignFirstResponder(); self.upperLimit1.resignFirstResponder(); self.incomeTax1.resignFirstResponder(); self.percentage1.resignFirstResponder()
        self.lowerLimit1.isUserInteractionEnabled = false; self.upperLimit1.isUserInteractionEnabled = false; self.incomeTax1.isUserInteractionEnabled = false; self.percentage1.isUserInteractionEnabled=false;
        
        self.lowerLimit2.resignFirstResponder(); self.upperLimit2.resignFirstResponder(); self.incomeTax2.resignFirstResponder(); self.percentage2.resignFirstResponder()
        self.lowerLimit2.isUserInteractionEnabled = false; self.upperLimit2.isUserInteractionEnabled = false; self.incomeTax2.isUserInteractionEnabled = false; self.percentage2.isUserInteractionEnabled=false;
        
        self.lowerLimit3.resignFirstResponder(); self.upperLimit3.resignFirstResponder(); self.incomeTax3.resignFirstResponder(); self.percentage3.resignFirstResponder()
        self.lowerLimit3.isUserInteractionEnabled = false; self.upperLimit3.isUserInteractionEnabled = false; self.incomeTax3.isUserInteractionEnabled = false; self.percentage3.isUserInteractionEnabled=false;
        
        self.lowerLimit4.resignFirstResponder(); self.upperLimit4.resignFirstResponder(); self.incomeTax4.resignFirstResponder(); self.percentage4.resignFirstResponder()
        self.lowerLimit4.isUserInteractionEnabled = false; self.upperLimit4.isUserInteractionEnabled = false; self.incomeTax4.isUserInteractionEnabled = false; self.percentage4.isUserInteractionEnabled=false;
        
        self.lowerLimit5.resignFirstResponder(); self.upperLimit5.resignFirstResponder(); self.incomeTax5.resignFirstResponder(); self.percentage5.resignFirstResponder()
        self.lowerLimit5.isUserInteractionEnabled = false; self.upperLimit5.isUserInteractionEnabled = false; self.incomeTax5.isUserInteractionEnabled = false; self.percentage5.isUserInteractionEnabled=false;
        
        self.lowerLimit6.resignFirstResponder(); self.upperLimit6.resignFirstResponder(); self.incomeTax6.resignFirstResponder(); self.percentage6.resignFirstResponder()
        self.lowerLimit6.isUserInteractionEnabled = false; self.upperLimit6.isUserInteractionEnabled = false; self.incomeTax6.isUserInteractionEnabled = false; self.percentage6.isUserInteractionEnabled=false;
        
        self.lowerLimit7.resignFirstResponder(); self.upperLimit7.resignFirstResponder(); self.incomeTax7.resignFirstResponder(); self.percentage7.resignFirstResponder()
        self.lowerLimit7.isUserInteractionEnabled = false; self.upperLimit7.isUserInteractionEnabled = false; self.incomeTax7.isUserInteractionEnabled = false; self.percentage7.isUserInteractionEnabled=false;
        
        self.lowerLimit8.resignFirstResponder(); self.upperLimit8.resignFirstResponder(); self.incomeTax8.resignFirstResponder(); self.percentage8.resignFirstResponder()
        self.lowerLimit8.isUserInteractionEnabled = false; self.upperLimit8.isUserInteractionEnabled = false; self.incomeTax8.isUserInteractionEnabled = false; self.percentage8.isUserInteractionEnabled=false;
        
        self.lowerLimit9.resignFirstResponder(); self.upperLimit9.resignFirstResponder(); self.incomeTax9.resignFirstResponder(); self.percentage9.resignFirstResponder()
        self.lowerLimit9.isUserInteractionEnabled = false; self.upperLimit9.isUserInteractionEnabled = false; self.incomeTax9.isUserInteractionEnabled = false; self.percentage9.isUserInteractionEnabled=false;
        
        self.lowerLimit10.resignFirstResponder(); self.upperLimit10.resignFirstResponder(); self.incomeTax10.resignFirstResponder(); self.percentage10.resignFirstResponder()
        self.lowerLimit10.isUserInteractionEnabled = false; self.upperLimit10.isUserInteractionEnabled = false; self.incomeTax10.isUserInteractionEnabled = false; self.percentage10.isUserInteractionEnabled=false;
        
        self.lowerLimit11.resignFirstResponder(); self.upperLimit11.resignFirstResponder(); self.incomeTax11.resignFirstResponder(); self.percentage11.resignFirstResponder()
        self.lowerLimit11.isUserInteractionEnabled = false; self.upperLimit11.isUserInteractionEnabled = false; self.incomeTax11.isUserInteractionEnabled = false; self.percentage11.isUserInteractionEnabled=false;
        
        self.lowerLimit12.resignFirstResponder(); self.upperLimit12.resignFirstResponder(); self.incomeTax12.resignFirstResponder(); self.percentage12.resignFirstResponder()
        self.lowerLimit12.isUserInteractionEnabled = false; self.upperLimit12.isUserInteractionEnabled = false; self.incomeTax12.isUserInteractionEnabled = false; self.percentage12.isUserInteractionEnabled=false;

        //now saving data into userdefaults...
        if let slabsInfoArray : NSMutableArray = UserDefaults.standard.object(forKey: "slabsInfoArray") as! NSMutableArray{
            print(slabsInfoArray)
            
            var testArray : NSMutableArray = slabsInfoArray.mutableCopy() as! NSMutableArray
//            var lowerLimitVar = "self.lowerLimit"+"\(count+1)"
//            var upperLimitVar = "self.upperLimit"+"\(count+1)"
//            var incomeTaxVar = "self.incomeTax"+"\(count+1)"
//            var percentageVar = "self.percentage"+"\(count+1)"
            
            
            var lowerLimitVar = Int()
            var upperLimitVar = Int()
            var incomeTaxVar = Int()
            var percentageVar = Double()
                
                
            lowerLimitVar = Int(self.lowerLimit1.text!)!
            upperLimitVar = Int(self.upperLimit1.text!)!
            incomeTaxVar = Int(self.incomeTax1.text!)!
            percentageVar = Double(self.percentage1.text!)!
            
            var dict1 = NSMutableDictionary()
            dict1.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict1.setValue(upperLimitVar, forKey: "upperLimit")
            dict1.setValue(incomeTaxVar, forKey: "incomeTax")
            dict1.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
//            slabsInfoArray[0] = dict1.mutableCopy()
//            slabsInfoArray.removeObject(at: 0)
//            slabsInfoArray[0] = nil
//            slabsInfoArray[0] = dict1
            testArray[0] = dict1
//            slabsInfoArray.replaceObject(at: 0, with: dict1)
            
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0

            //for 2nd row ******************************
            lowerLimitVar = Int(self.lowerLimit2.text!)!
            upperLimitVar = Int(self.upperLimit2.text!)!
            incomeTaxVar = Int(self.incomeTax2.text!)!
            percentageVar = Double(self.percentage2.text!)!
            
            var dict2 = NSMutableDictionary()
            dict2.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict2.setValue(upperLimitVar, forKey: "upperLimit")
            dict2.setValue(incomeTaxVar, forKey: "incomeTax")
            dict2.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[1] = dict2
//            slabsInfoArray.insert(dict2, at: 1)
            
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 3rd row ******************************
            lowerLimitVar = Int(self.lowerLimit3.text!)!
            upperLimitVar = Int(self.upperLimit3.text!)!
            incomeTaxVar = Int(self.incomeTax3.text!)!
            percentageVar = Double(self.percentage3.text!)!
            
            var dict3 = NSMutableDictionary()
            dict3.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict3.setValue(upperLimitVar, forKey: "upperLimit")
            dict3.setValue(incomeTaxVar, forKey: "incomeTax")
            dict3.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[2] = dict3
//            slabsInfoArray.insert(dict3, at: 2)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 4th row ******************************
            lowerLimitVar = Int(self.lowerLimit4.text!)!
            upperLimitVar = Int(self.upperLimit4.text!)!
            incomeTaxVar = Int(self.incomeTax4.text!)!
            percentageVar = Double(self.percentage4.text!)!
            
            var dict4 = NSMutableDictionary()
            dict4.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict4.setValue(upperLimitVar, forKey: "upperLimit")
            dict4.setValue(incomeTaxVar, forKey: "incomeTax")
            dict4.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[3] = dict4
//            slabsInfoArray.insert(dict4, at: 3)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 5th row ******************************
            lowerLimitVar = Int(self.lowerLimit5.text!)!
            upperLimitVar = Int(self.upperLimit5.text!)!
            incomeTaxVar = Int(self.incomeTax5.text!)!
            percentageVar = Double(self.percentage5.text!)!
            
            var dict5 = NSMutableDictionary()
            dict5.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict5.setValue(upperLimitVar, forKey: "upperLimit")
            dict5.setValue(incomeTaxVar, forKey: "incomeTax")
            dict5.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[4] = dict5
//            slabsInfoArray.insert(dict5, at: 4)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 6th row ******************************
            lowerLimitVar = Int(self.lowerLimit6.text!)!
            upperLimitVar = Int(self.upperLimit6.text!)!
            incomeTaxVar = Int(self.incomeTax6.text!)!
            percentageVar = Double(self.percentage6.text!)!
            
            var dict6 = NSMutableDictionary()
            dict6.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict6.setValue(upperLimitVar, forKey: "upperLimit")
            dict6.setValue(incomeTaxVar, forKey: "incomeTax")
            dict6.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[5] = dict6
//            slabsInfoArray.insert(dict6, at:5)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 7th row ******************************
            lowerLimitVar = Int(self.lowerLimit7.text!)!
            upperLimitVar = Int(self.upperLimit7.text!)!
            incomeTaxVar = Int(self.incomeTax7.text!)!
            percentageVar = Double(self.percentage7.text!)!
            
            var dict7 = NSMutableDictionary()
            dict7.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict7.setValue(upperLimitVar, forKey: "upperLimit")
            dict7.setValue(incomeTaxVar, forKey: "incomeTax")
            dict7.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[6] = dict7
//            slabsInfoArray.insert(dict7, at: 6)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0

            //for 8th row ******************************
            lowerLimitVar = Int(self.lowerLimit8.text!)!
            upperLimitVar = Int(self.upperLimit8.text!)!
            incomeTaxVar = Int(self.incomeTax8.text!)!
            percentageVar = Double(self.percentage8.text!)!
            
            var dict8 = NSMutableDictionary()
            dict8.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict8.setValue(upperLimitVar, forKey: "upperLimit")
            dict8.setValue(incomeTaxVar, forKey: "incomeTax")
            dict8.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[7] = dict8
//            slabsInfoArray.insert(dict8, at: 7)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 9th row ******************************
            lowerLimitVar = Int(self.lowerLimit9.text!)!
            upperLimitVar = Int(self.upperLimit9.text!)!
            incomeTaxVar = Int(self.incomeTax9.text!)!
            percentageVar = Double(self.percentage9.text!)!
            
            var dict9 = NSMutableDictionary()
            dict9.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict9.setValue(upperLimitVar, forKey: "upperLimit")
            dict9.setValue(incomeTaxVar, forKey: "incomeTax")
            dict9.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[8] = dict9
//            slabsInfoArray.insert(dict9, at: 8)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 10th row ******************************
            lowerLimitVar = Int(self.lowerLimit10.text!)!
            upperLimitVar = Int(self.upperLimit10.text!)!
            incomeTaxVar = Int(self.incomeTax10.text!)!
            percentageVar = Double(self.percentage10.text!)!
            
            var dict10 = NSMutableDictionary()
            dict10.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict10.setValue(upperLimitVar, forKey: "upperLimit")
            dict10.setValue(incomeTaxVar, forKey: "incomeTax")
            dict10.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[9] = dict10
//            slabsInfoArray.insert(dict10, at: 9)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 11th row ******************************
            lowerLimitVar = Int(self.lowerLimit11.text!)!
            upperLimitVar = Int(self.upperLimit11.text!)!
            incomeTaxVar = Int(self.incomeTax11.text!)!
            percentageVar = Double(self.percentage11.text!)!
            
            var dict11 = NSMutableDictionary()
            dict11.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict11.setValue(upperLimitVar, forKey: "upperLimit")
            dict11.setValue(incomeTaxVar, forKey: "incomeTax")
            dict11.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[10] = dict11
//            slabsInfoArray.insert(dict11, at: 10)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            //for 12th row ******************************
            lowerLimitVar = Int(self.lowerLimit12.text!)!
            upperLimitVar = Int(self.upperLimit12.text!)!
            incomeTaxVar = Int(self.incomeTax12.text!)!
            percentageVar = Double(self.percentage12.text!)!
            
            var dict12 = NSMutableDictionary()
            dict12.setValue(lowerLimitVar, forKey: "lowerLimit")
            dict12.setValue(upperLimitVar, forKey: "upperLimit")
            dict12.setValue(incomeTaxVar, forKey: "incomeTax")
            dict12.setValue(percentageVar, forKey: "percentage")
            
            //adding element into the array
            testArray[11] = dict12
//            slabsInfoArray.insert(dict12, at: 11)
            //now setting variables values to zero
            lowerLimitVar = 0 ; upperLimitVar = 0 ; incomeTaxVar  = 0 ; percentageVar = 0.0
            
            
            //Now saving the array into userdefaults
            UserDefaults.standard.set(testArray, forKey: "slabsInfoArray")
            UserDefaults.standard.synchronize()

        }
        //end
        
        
        
//        let vc = ResultScreenViewController(
//            nibName: "ResultScreenViewController",
//            bundle: nil)
//        self.present(vc, animated: true, completion: nil)
        
    }
    
    //End *********************************************************
    func setTextFieldDelegate(){
        //1st row
        self.lowerLimit1.delegate = self
        self.upperLimit1.delegate = self
        self.incomeTax1.delegate = self
        self.percentage1.delegate = self
        
        //2nd row
        self.lowerLimit2.delegate = self
        self.upperLimit2.delegate = self
        self.incomeTax2.delegate = self
        self.percentage2.delegate = self
        
        //3rd row
        self.lowerLimit3.delegate = self
        self.upperLimit3.delegate = self
        self.incomeTax3.delegate = self
        self.percentage3.delegate = self
        
        //4th row
        self.lowerLimit4.delegate = self
        self.upperLimit4.delegate = self
        self.incomeTax4.delegate = self
        self.percentage4.delegate = self
        
        //5th row
        self.lowerLimit5.delegate = self
        self.upperLimit5.delegate = self
        self.incomeTax5.delegate = self
        self.percentage5.delegate = self
        
        //6th row
        self.lowerLimit6.delegate = self
        self.upperLimit6.delegate = self
        self.incomeTax6.delegate = self
        self.percentage6.delegate = self
        
        //7th row
        self.lowerLimit7.delegate = self
        self.upperLimit7.delegate = self
        self.incomeTax7.delegate = self
        self.percentage7.delegate = self
        
        //8th row
        self.lowerLimit8.delegate = self
        self.upperLimit8.delegate = self
        self.incomeTax8.delegate = self
        self.percentage8.delegate = self
        
        //9th row
        self.lowerLimit9.delegate = self
        self.upperLimit9.delegate = self
        self.incomeTax9.delegate = self
        self.percentage9.delegate = self
        
        //10th row
        self.lowerLimit10.delegate = self
        self.upperLimit10.delegate = self
        self.incomeTax10.delegate = self
        self.percentage10.delegate = self
        
        //11th row
        self.lowerLimit11.delegate = self
        self.upperLimit11.delegate = self
        self.incomeTax11.delegate = self
        self.percentage11.delegate = self
        
        //12th row
        self.lowerLimit12.delegate = self
        self.upperLimit12.delegate = self
        self.incomeTax12.delegate = self
        self.percentage12.delegate = self
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
