//
//  HomeViewController.swift
//  TaxCalculator
//
//  Created by user 1 on 03/08/2017.
//  Copyright © 2017 ahmad. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomeViewController: ValidationViewController, UITextFieldDelegate,GADBannerViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var fromYear: UIPickerView!
    @IBOutlet weak var toYear: UIPickerView!

    @IBOutlet weak var myBannerView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var grossSalary: UITextField!
    @IBOutlet weak var houseRentAllowance: UITextField!
    @IBOutlet weak var costOfFreeUnits: UITextField!
    @IBOutlet weak var costOfUnconsumedUnits: UITextField!
    @IBOutlet weak var otherIncome: UITextField!
    @IBOutlet weak var donationDeducted: UITextField!
    @IBOutlet weak var zakatDeducted: UITextField!
    @IBOutlet weak var rebateTaxAlreadyPaid: UITextField!
    @IBOutlet weak var taxAlreadyDeductedInSalary: UITextField!
    @IBOutlet weak var taxAlreadyDeductedIncome: UITextField!
    
    @IBOutlet weak var grossSalaryLbl: UILabel!
    @IBOutlet weak var housesRentAllowanceLbl: UILabel!
    @IBOutlet weak var costOfFreeElectricityLbl: UILabel!
    @IBOutlet weak var costOfUnconsumedUnitsLbl: UILabel!
    @IBOutlet weak var otherIncomeLbl: UILabel!
    @IBOutlet weak var donationDeductedLbl: UILabel!
    @IBOutlet weak var zakatDeductedLbl: UILabel!
    @IBOutlet weak var rebateTaxLbl: UILabel!
    @IBOutlet weak var taxAlreadyDeductedLbl: UILabel!
    @IBOutlet weak var taxDeductedIncomeLbl: UILabel!
    
    
    
    
    
    
    var activeField: UITextField?
    
    var bannerView: GADBannerView!
    
    lazy var adBannerView: GADBannerView = {
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-8501671653071605/1974659335"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        return adBannerView
    }()
    
    
    //Mark : AdBanner Delegate functions...!
    func adViewDidReceiveAd(_ bannerView: GADBannerView!) {
        print("Banner loaded successfully")
//        bannerView.frame = self.myBannerView.frame
        self.myBannerView.addSubview(bannerView)
        
        self.myBannerView.frame = bannerView.frame
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
        
    }
    
    func adView(_ bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("Fail to receive ads")
        print(error)
    }
    /// Tells the delegate that a full screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
        bannerView.removeFromSuperview()
    }
    
    //End mark...!!!
    
    var fromYearArray = NSMutableArray()
    var toYearArray   = NSMutableArray()
    
    var fromYearSelected = String()
    var toYearSelected   = String()
    
    //Mark : View LifeCycle.... ******
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //year selection arrays
        
         self.fromYearArray = ["1990", "1991", "1992", "1993", "1994", "1995", "1996","1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036", "2037", "2038", "2039", "2040", "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048", "2049", "2050"]
        self.toYearArray = ["1990", "1991", "1992", "1993", "1994", "1995", "1996","1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031", "2032", "2033", "2034", "2035", "2036", "2037", "2038", "2039", "2040", "2041", "2042", "2043", "2044", "2045", "2046", "2047", "2048", "2049", "2050"]
        
        fromYear.delegate = self
        toYear.delegate   = self
        
        fromYear.dataSource = self
        toYear.dataSource   = self
        
        
        self.fromYear.selectRow(26, inComponent: 0, animated: false)
        self.toYear.selectRow(27, inComponent: 0, animated: false)
        
        self.fromYearSelected = "2016"
        self.toYearSelected = "2017"
        //end
        
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID,                       // All simulators
            "03722c52d89c963a4f8add797ee1aa812bf5ef6d" ];
        
//        var adBannerView: GADBannerView?
        adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
//        adBannerView.adUnitID = "a-app-pub-5758974607162669/4357501237"
        //This is sample ad unit id
        adBannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
//        self.adBanner.center =
//            CGPointMake(self.view.center.x, self.adBanner.center.y);
        
        self.adBannerView.center = CGPoint(x: self.view.center.x,  y: adBannerView.center.y)
        adBannerView.load(GADRequest())
        
        
//        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
//        self.view.addSubview(bannerView)
////        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//        bannerView.adUnitID = "a-app-pub-5758974607162669/4357501237"
//        
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
        
        if UIDevice().userInterfaceIdiom == .phone {
            if( UIScreen.main.nativeBounds.height == 480) {
            
                print("iPhone Classic")
            }
            else if( UIScreen.main.nativeBounds.height == 960){
                print("iPhone 4 or 4S")
                grossSalaryLbl.font = grossSalaryLbl.font.withSize(20)
                housesRentAllowanceLbl.font = housesRentAllowanceLbl.font.withSize(20)
                costOfFreeElectricityLbl.font = costOfFreeElectricityLbl.font.withSize(20)
                costOfUnconsumedUnitsLbl.font = costOfUnconsumedUnitsLbl.font.withSize(20)
                otherIncomeLbl.font = otherIncomeLbl.font.withSize(20)
                donationDeductedLbl.font = donationDeductedLbl.font.withSize(20)
                zakatDeductedLbl.font = zakatDeductedLbl.font.withSize(20)
                rebateTaxLbl.font = rebateTaxLbl.font.withSize(20)
                taxAlreadyDeductedLbl.font = taxAlreadyDeductedLbl.font.withSize(20)
                taxDeductedIncomeLbl.font = taxDeductedIncomeLbl.font.withSize(20)
            }
            else if(UIScreen.main.nativeBounds.height == 1136){
                print("iPhone 5 or 5S or 5C")
                grossSalaryLbl.font = grossSalaryLbl.font.withSize(12.5)
                housesRentAllowanceLbl.font = housesRentAllowanceLbl.font.withSize(12.5)
                costOfFreeElectricityLbl.font = costOfFreeElectricityLbl.font.withSize(12.5)
                costOfUnconsumedUnitsLbl.font = costOfUnconsumedUnitsLbl.font.withSize(12.5)
                otherIncomeLbl.font = otherIncomeLbl.font.withSize(12.5)
                donationDeductedLbl.font = donationDeductedLbl.font.withSize(12.5)
                zakatDeductedLbl.font = zakatDeductedLbl.font.withSize(12.5)
                rebateTaxLbl.font = rebateTaxLbl.font.withSize(12.5)
                taxAlreadyDeductedLbl.font = taxAlreadyDeductedLbl.font.withSize(12.5)
                taxDeductedIncomeLbl.font = taxDeductedIncomeLbl.font.withSize(12.5)
            }
        }

        
        if let isSaved : String = UserDefaults.standard.value(forKey: "slabsInfoSaved") as! String?{
            if(isSaved == "yes"){
                print("already saved")
            }
        }
        else{
            self.saveSlabsInUserDefaults()
        }
        
        
        self.scrollView.contentSize = CGSize(width: 320, height: 568)
        let tap = UITapGestureRecognizer(target: self, action: #selector
            (tapFunction))
        self.scrollView.addGestureRecognizer(tap)
        
        //register notification
        self.registerForKeyboardNotifications()
        //end
        
        //set Textfield delegate
        self.grossSalary.delegate = self
        self.houseRentAllowance.delegate = self
        self.costOfFreeUnits.delegate = self
        self.costOfUnconsumedUnits.delegate = self
        self.otherIncome.delegate = self
        self.donationDeducted.delegate = self
        self.zakatDeducted.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: UITapGesture method
    func tapFunction(sender:UITapGestureRecognizer){
        self.grossSalary.resignFirstResponder()
        self.houseRentAllowance.resignFirstResponder()
        self.costOfFreeUnits.resignFirstResponder()
        self.costOfUnconsumedUnits.resignFirstResponder()
        self.otherIncome.resignFirstResponder()
        self.donationDeducted.resignFirstResponder()
        self.zakatDeducted.resignFirstResponder()
        self.rebateTaxAlreadyPaid.resignFirstResponder()
        self.taxAlreadyDeductedInSalary.resignFirstResponder()
        self.taxAlreadyDeductedIncome.resignFirstResponder()
    }
    //end
    
    //Mark: UITextField delegate functions
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.grossSalary.resignFirstResponder()
        self.houseRentAllowance.resignFirstResponder()
        self.costOfFreeUnits.resignFirstResponder()
        self.costOfUnconsumedUnits.resignFirstResponder()
        self.otherIncome.resignFirstResponder()
        self.donationDeducted.resignFirstResponder()
        self.zakatDeducted.resignFirstResponder()
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
    
    
    //Mark Tax calculate button methods ***********************
    @IBAction func taxCalculateBtnClicked(_ sender: UIButton) {
        
        let strGrossSalary1 = grossSalary.text!;
        let strHouseRentAllowance1 = houseRentAllowance.text!;
        let strCostofFreeUnits1 = costOfFreeUnits.text!;
        let strCostOfUnconsumedUnits1 = costOfUnconsumedUnits.text!;
        let strOtherIncome1 = otherIncome.text!;
        let strDonationDeducted1 = donationDeducted.text!;
        let strZakatDeducted1 = zakatDeducted.text!;
        let strRebateTaxAlreadyPaid1 = rebateTaxAlreadyPaid.text!;
        let strTaxAlreadyDeductedInSalary1 = taxAlreadyDeductedInSalary.text!;
        let strTaxAlreadyDeductedIncome1 = taxAlreadyDeductedIncome.text!;
        
        var strGrossSalary = Double()
        var strHouseRentAllowance = Double()
        var strCostofFreeUnits = Double()
        var strCostOfUnconsumedUnits = Double()
        var strOtherIncome = Double()
        var strDonationDeducted = Double()
        var strZakatDeducted = Double()
        var strRebateTaxAlreadyPaid = Double()
        var strTaxAlreadyDeductedInSalary = Double()
        var strTaxAlreadyDeductedIncome = Double()
        
        if(strGrossSalary1.characters.count == 0){
            strGrossSalary = 0
        }
        else{
            strGrossSalary = Double(grossSalary.text!)!;
        }
        
        if(strHouseRentAllowance1.characters.count == 0){
            strHouseRentAllowance = 0
        }
        else{
            strHouseRentAllowance = Double(houseRentAllowance.text!)!;
        }
        
        if(strCostofFreeUnits1.characters.count == 0){
            strCostofFreeUnits = 0
        }
        else{
            strCostofFreeUnits = Double(costOfFreeUnits.text!)!
        }
        
        if(strCostOfUnconsumedUnits1.characters.count == 0){
            strCostOfUnconsumedUnits = 0
        }
        else{
            strCostOfUnconsumedUnits = Double(costOfUnconsumedUnits.text!)!
        }
        
        if(strOtherIncome1.characters.count == 0){
            strOtherIncome = 0
        }
        else{
            strOtherIncome = Double(otherIncome.text!)!
        }
        
        if(strDonationDeducted1.characters.count == 0){
            strDonationDeducted = 0
        }
        else{
            strDonationDeducted = Double(donationDeducted.text!)!
        }
        
        if(strZakatDeducted1.characters.count == 0){
            strZakatDeducted = 0
        }
        else{
            strZakatDeducted = Double(zakatDeducted.text!)!
        }
        
        if(strRebateTaxAlreadyPaid1.characters.count == 0){
            strRebateTaxAlreadyPaid = 0
        }
        else{
            strRebateTaxAlreadyPaid = Double(rebateTaxAlreadyPaid.text!)!
        }
        
        if(strTaxAlreadyDeductedInSalary1.characters.count == 0){
            strTaxAlreadyDeductedInSalary = 0
        }
        else{
            strTaxAlreadyDeductedInSalary = Double(taxAlreadyDeductedInSalary.text!)!
        }
        
        if(strTaxAlreadyDeductedIncome1.characters.count == 0){
            strTaxAlreadyDeductedIncome = 0
        }
        else{
            strTaxAlreadyDeductedIncome = Double(taxAlreadyDeductedIncome.text!)!
        }
        
        if let slabsInfoArray : NSMutableArray = UserDefaults.standard.object(forKey: "slabsInfoArray") as? NSMutableArray{
            print(slabsInfoArray)
            
            var count = 0
            while (count < slabsInfoArray.count) {
                var dict : NSMutableDictionary = slabsInfoArray.object(at: count) as! NSMutableDictionary
                
                var lowerLimit : Int = dict.value(forKey: "lowerLimit") as! Int
                var upperLimit : Int = dict.value(forKey: "upperLimit") as! Int
                var incomeTax : Int = dict.value(forKey: "incomeTax") as! Int
                var percentage : Double = dict.value(forKey: "percentage") as! Double
                
                var userTotalIncome : Int = Int(strGrossSalary) + Int(strHouseRentAllowance) + Int(strCostofFreeUnits) - Int(strCostOfUnconsumedUnits) + Int(strOtherIncome)
                var deductionCalculatedIncome : Int = Int(strDonationDeducted) + Int(strZakatDeducted)
                //This is the total amount on which we have to calculate the tax
                var totalAmount = userTotalIncome - deductionCalculatedIncome
                
                
                
                
                
                
                if(totalAmount > lowerLimit && totalAmount <= upperLimit){
                    //it means that our required slab is found
                    
                    
                    var doubleTotalAmountVariable = Double(totalAmount)
                    var taxCalculatedOnTotalIncome = (percentage/100.0) * doubleTotalAmountVariable
                    
                    //This is the tax which user have to pay, means total tax + fixed tax
                    var totalTaxCalculatedOnIncome : Double = taxCalculatedOnTotalIncome + Double(incomeTax)
                    
                    //This is the tax which the user already paid...
                    var deductionTaxCalculated : Int = Int(strRebateTaxAlreadyPaid) + Int(strTaxAlreadyDeductedInSalary) + Int(strTaxAlreadyDeductedIncome)
                    
                    //so now, subtracting deductionTaxCalculated from totalTaxCalculatedonIncome
                    
                    var totalTax = totalTaxCalculatedOnIncome - Double(deductionTaxCalculated)
                    
                    print(totalTax)
                    
                    UserDefaults.standard.set(lowerLimit, forKey: "lowerLimitShow")
                    UserDefaults.standard.set(incomeTax, forKey: "incomeTaxShow")
                    UserDefaults.standard.set(percentage, forKey: "percentageShow")
                    UserDefaults.standard.set(taxCalculatedOnTotalIncome, forKey: "taxIncome")
                    UserDefaults.standard.set(Double(strRebateTaxAlreadyPaid), forKey: "rebateTaxalreadyPaid")
                    UserDefaults.standard.set(Double(strTaxAlreadyDeductedInSalary), forKey: "taxAlreadyDeductedInSalary")
                    UserDefaults.standard.set(Double(strTaxAlreadyDeductedIncome), forKey: "taxAlreadyDeductedIncome")
                    UserDefaults.standard.set(totalTax, forKey: "OriginalTax")
                    UserDefaults.standard.set(totalAmount, forKey: "TotalAmountForTax")
                    
                    var msgStr = "Your Total Tax calculated is " + "\(totalTax)"
                    
                    
                    //This is my code for saving info to show up on the pdf screen
                    UserDefaults.standard.set(String(strGrossSalary), forKey: "grossSalary")
                    UserDefaults.standard.set(String(strHouseRentAllowance), forKey: "houseRentAllowance")
                    UserDefaults.standard.set(String(strCostofFreeUnits), forKey: "costOfFreeUnits")
                    UserDefaults.standard.set(String(strCostOfUnconsumedUnits), forKey: "costOfUnconsumedUnits")
                    UserDefaults.standard.set(String(strOtherIncome), forKey: "otherIncome")
                    UserDefaults.standard.set(String(strDonationDeducted), forKey: "donationDeducted")
                    UserDefaults.standard.set(String(strZakatDeducted), forKey: "zakatDeducted")
                    
                    
                    //now saving year strings
                    
                    UserDefaults.standard.set(fromYearSelected, forKey: "fromYearSelected")
                    UserDefaults.standard.set(toYearSelected, forKey: "toYearSelected")
                    UserDefaults.standard.synchronize()
                    //end
                    let vc = ResultScreenViewController(
                        nibName: "ResultScreenViewController",
                        bundle: nil)
                    self.present(vc, animated: true, completion: nil)
                    
                }
                    
                //now checking that if the limit exists for the last range
                
                if(count == slabsInfoArray.count-1){
                    var dict : NSMutableDictionary = slabsInfoArray.object(at: count) as! NSMutableDictionary
                    
                    var lowerLimit : Int = dict.value(forKey: "lowerLimit") as! Int
                    var upperLimit : Int = dict.value(forKey: "upperLimit") as! Int
                    var incomeTax : Int = dict.value(forKey: "incomeTax") as! Int
                    var percentage : Double = dict.value(forKey: "percentage") as! Double
                    
                    var userTotalIncome : Int = Int(strGrossSalary) + Int(strHouseRentAllowance) + Int(strCostofFreeUnits) - Int(strCostOfUnconsumedUnits) + Int(strOtherIncome)
                    var deductionCalculatedIncome : Int = Int(strDonationDeducted) + Int(strZakatDeducted)
                    //This is the total amount on which we have to calculate the tax
                    var totalAmount = userTotalIncome - deductionCalculatedIncome
                    
                    if(totalAmount > lowerLimit){
                        //it means that our required slab is found
                        
                        
                        var doubleTotalAmountVariable = Double(totalAmount)
                        var taxCalculatedOnTotalIncome = (percentage/100.0) * doubleTotalAmountVariable
                        
                        //This is the tax which user have to pay, means total tax + fixed tax
                        var totalTaxCalculatedOnIncome : Double = taxCalculatedOnTotalIncome + Double(incomeTax)
                        
                        //This is the tax which the user already paid...
                        var deductionTaxCalculated : Int = Int(strRebateTaxAlreadyPaid) + Int(strTaxAlreadyDeductedInSalary) + Int(strTaxAlreadyDeductedIncome)
                        
                        //so now, subtracting deductionTaxCalculated from totalTaxCalculatedonIncome
                        
                        var totalTax = totalTaxCalculatedOnIncome - Double(deductionTaxCalculated)
                        
                        print(totalTax)
                        
                        UserDefaults.standard.set(lowerLimit, forKey: "lowerLimitShow")
                        UserDefaults.standard.set(incomeTax, forKey: "incomeTaxShow")
                        UserDefaults.standard.set(percentage, forKey: "percentageShow")
                        UserDefaults.standard.set(taxCalculatedOnTotalIncome, forKey: "taxIncome")
                        UserDefaults.standard.set(Double(strRebateTaxAlreadyPaid), forKey: "rebateTaxalreadyPaid")
                        UserDefaults.standard.set(Double(strTaxAlreadyDeductedInSalary), forKey: "taxAlreadyDeductedInSalary")
                        UserDefaults.standard.set(Double(strTaxAlreadyDeductedIncome), forKey: "taxAlreadyDeductedIncome")
                        UserDefaults.standard.set(totalTax, forKey: "OriginalTax")
                        UserDefaults.standard.set(totalAmount, forKey: "TotalAmountForTax")
                        
                        var msgStr = "Your Total Tax calculated is " + "\(totalTax)"
                        
                        
                        //This is my code for saving info to show up on the pdf screen
                        UserDefaults.standard.set(String(strGrossSalary), forKey: "grossSalary")
                        UserDefaults.standard.set(String(strHouseRentAllowance), forKey: "houseRentAllowance")
                        UserDefaults.standard.set(String(strCostofFreeUnits), forKey: "costOfFreeUnits")
                        UserDefaults.standard.set(String(strCostOfUnconsumedUnits), forKey: "costOfUnconsumedUnits")
                        UserDefaults.standard.set(String(strOtherIncome), forKey: "otherIncome")
                        UserDefaults.standard.set(String(strDonationDeducted), forKey: "donationDeducted")
                        UserDefaults.standard.set(String(strZakatDeducted), forKey: "zakatDeducted")
                        
                        //now saving year strings
                        
                        UserDefaults.standard.set(fromYearSelected, forKey: "fromYearSelected")
                        UserDefaults.standard.set(toYearSelected, forKey: "toYearSelected")
                        UserDefaults.standard.synchronize()
                        //end
                        let vc = ResultScreenViewController(
                            nibName: "ResultScreenViewController",
                            bundle: nil)
                        self.present(vc, animated: true, completion: nil)

                    }
                }
                
                count += 1
            }
        }
        
        
        
//        if strGrossSalary.characters.count==0{
//            ShowAlert("Please provide grossSalary.")
//        }else if strHouseRentAllowance.characters.count == 0{
//            ShowAlert("Please provide House Rent")
//        }else if strCostofFreeUnits.characters.count == 0{
//            ShowAlert("Please provide cost of free units")
//        }else if strCostOfUnconsumedUnits.characters.count == 0{
//            ShowAlert("Please provide cost of unconsumed units")
//        }else if strOtherIncome.characters.count == 0{
//            ShowAlert("Please provide other income")
//        }else{
//            if let slabsInfoArray : NSMutableArray = UserDefaults.standard.object(forKey: "slabsInfoArray") as? NSMutableArray{
//                print(slabsInfoArray)
//                
//            }
//        }
    }

    
    //end *****************************************************
    
    
    
    //MArk : First time, save info into the userdefaults
    func saveSlabsInUserDefaults(){
        
        if let slabsInfoArray : NSMutableArray = UserDefaults.standard.object(forKey: "slabsInfoArray") as? NSMutableArray{
            print(slabsInfoArray)
            
        }

        
        var dict1 = NSMutableDictionary()
        
        var slabsArray = NSMutableArray()
        
        var dict = NSMutableDictionary()
        dict1.setValue(0, forKey: "lowerLimit")
        dict1.setValue(400000, forKey: "upperLimit")
        dict1.setValue(0, forKey: "incomeTax")
        dict1.setValue(0, forKey: "percentage")
//        dict.removeAllObjects()
//        dict.setObject(dict1, forKey: "first" as NSCopying)
        slabsArray[0] = dict1
        
        var dict2 = NSMutableDictionary()
        dict2.setValue(400000, forKey: "lowerLimit")
        dict2.setValue(500000, forKey: "upperLimit")
        dict2.setValue(0, forKey: "incomeTax")
        dict2.setValue(2, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict2, forKey: "second" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[1] = dict2
        
        var dict3 = NSMutableDictionary()
        dict3.setValue(500000, forKey: "lowerLimit")
        dict3.setValue(750000, forKey: "upperLimit")
        dict3.setValue(2000, forKey: "incomeTax")
        dict3.setValue(5, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict3, forKey: "third" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[2] = dict3
        
        print(slabsArray)
        
        var dict4 = NSMutableDictionary()
        dict4.setValue(750000, forKey: "lowerLimit")
        dict4.setValue(1400000, forKey: "upperLimit")
        dict4.setValue(14500, forKey: "incomeTax")
        dict4.setValue(10, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict4, forKey: "fourth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[3] = dict4
        
        var dict5 = NSMutableDictionary()
        dict5.setValue(1400000, forKey: "lowerLimit")
        dict5.setValue(1500000, forKey: "upperLimit")
        dict5.setValue(79500, forKey: "incomeTax")
        dict5.setValue(12.5, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict5, forKey: "fifth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[4] = dict5
        
        var dict6 = NSMutableDictionary()
        dict6.setValue(1500000, forKey: "lowerLimit")
        dict6.setValue(1800000, forKey: "upperLimit")
        dict6.setValue(92000, forKey: "incomeTax")
        dict6.setValue(15, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict6, forKey: "sixth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[5] = dict6
        
        var dict7 = NSMutableDictionary()
        dict7.setValue(1800000, forKey: "lowerLimit")
        dict7.setValue(2500000, forKey: "upperLimit")
        dict7.setValue(137000, forKey: "incomeTax")
        dict7.setValue(17.5, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict7, forKey: "seventh" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[6] = dict7
        
        var dict8 = NSMutableDictionary()
        dict8.setValue(2500000, forKey: "lowerLimit")
        dict8.setValue(3000000, forKey: "upperLimit")
        dict8.setValue(259500, forKey: "incomeTax")
        dict8.setValue(20, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict8, forKey: "eighth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[7] = dict8
        
        var dict9 = NSMutableDictionary()
        dict9.setValue(3000000, forKey: "lowerLimit")
        dict9.setValue(3500000, forKey: "upperLimit")
        dict9.setValue(359500, forKey: "incomeTax")
        dict9.setValue(22.5, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict9, forKey: "ninth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[8] = dict9
        
        var dict10 = NSMutableDictionary()
        dict10.setValue(3500000, forKey: "lowerLimit")
        dict10.setValue(4000000, forKey: "upperLimit")
        dict10.setValue(472000, forKey: "incomeTax")
        dict10.setValue(25, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict10, forKey: "tenth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[9] = dict10
        
        var dict11 = NSMutableDictionary()
        dict11.setValue(4000000, forKey: "lowerLimit")
        dict11.setValue(7000000, forKey: "upperLimit")
        dict11.setValue(597000, forKey: "incomeTax")
        dict11.setValue(27.5, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict11, forKey: "eleventh" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[10] = dict11
        
        var dict12 = NSMutableDictionary()
        dict12.setValue(7000000, forKey: "lowerLimit")
        dict12.setValue(0, forKey: "upperLimit")
        dict12.setValue(1422000, forKey: "incomeTax")
        dict12.setValue(30, forKey: "percentage")
        dict.removeAllObjects()
        dict.setObject(dict12, forKey: "twelveth" as NSCopying)
//        slabsArray.add(dict)
        slabsArray[11] = dict12
        
        print(slabsArray)
        
        UserDefaults.standard.set(slabsArray, forKey: "slabsInfoArray")
        UserDefaults.standard.set("yes", forKey: "slabsInfoSaved")
        UserDefaults.standard.synchronize()
        
        //end...
    }
    
    //MARK:UIPickerViewControllerDelegate ****************************************
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (pickerView == fromYear){
            return self.fromYearArray.count
        }
        else{
            return self.toYearArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView == fromYear){
            return ((self.fromYearArray.object(at: row) as AnyObject)) as? String
        }
        else{
            return ((self.toYearArray.object(at: row) as AnyObject)) as? String
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if(pickerView == fromYear){
            fromYearSelected = (((self.fromYearArray.object(at: row) as AnyObject)) as? String)!
        }
        else{
            toYearSelected = (((self.toYearArray.object(at: row) as AnyObject)) as? String)!
        }
    }

    
    @IBAction func goToSlab(_ sender: UIButton) {
        let vc = SlabEditorViewController(
            nibName: "SlabEditorViewController",
            bundle: nil)
        self.present(vc, animated: true, completion: nil)
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
