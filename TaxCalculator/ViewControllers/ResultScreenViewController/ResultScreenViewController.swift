//
//  ResultScreenViewController.swift
//  TaxCalculator
//
//  Created by user 1 on 03/08/2017.
//  Copyright © 2017 ahmad. All rights reserved.
//

import UIKit

class ResultScreenViewController: UIViewController {

    @IBOutlet weak var netTaxableIncome: UITextField!
    @IBOutlet weak var taxUpto: UITextField!
    @IBOutlet weak var taxOnAccessAmount: UITextField!
    @IBOutlet weak var totalTaxCalculated: UITextField!
    @IBOutlet weak var witholdingTax: UITextField!
    @IBOutlet weak var netTaxPayable: UITextField!
    @IBOutlet weak var taxAlreadyDeductedSalary: UITextField!
    @IBOutlet weak var taxAlreadyDeductedIncome: UITextField!
    @IBOutlet weak var balance: UITextField!
    
    @IBOutlet weak var taxAmount: UILabel!
    @IBOutlet weak var taxPercent: UILabel!
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         self.scrollView.contentSize = CGSize(width: 320, height: 568)        
        
        var first = Double()
        var second = Double()
        
        var netPayAbleText = Double()
        var deductedSalary = Double()
        var deductedIncome = Double()
        var lowerLimit = Double()
        var totalTaxRequired = Double()
        var taxPercentRate = Double()
        if let incomeTaxLowerLimit : Double = UserDefaults.standard.value(forKey: "lowerLimitShow") as! Double{
            self.taxAmount.text = String(incomeTaxLowerLimit)
            lowerLimit = incomeTaxLowerLimit
        }
        if let originalTax : Double = UserDefaults.standard.value(forKey: "TotalAmountForTax") as! Double?{
            self.netTaxableIncome.text = String(originalTax)
            totalTaxRequired = originalTax
        }
        if let netTaxableIncomeShow : Double = UserDefaults.standard.value(forKey: "incomeTaxShow") as! Double{
            self.taxUpto.text = String(netTaxableIncomeShow)
            first = netTaxableIncomeShow
        }
        if let percentage : Double = UserDefaults.standard.value(forKey: "percentageShow") as! Double{
            var str = "\(percentage)" + "%"
            self.taxPercent.text = str
            taxPercentRate = percentage
        }
        if let percentTaxShow : Double = UserDefaults.standard.value(forKey: "taxIncome") as! Double{
//            self.taxOnAccessAmount.text = String(percentTaxShow)
            
            var ans = totalTaxRequired - lowerLimit
            var ans2 = (ans) * (taxPercentRate/100)
            var ans3 = Int(ans2)
            self.taxOnAccessAmount.text = String(ans3)
            second = ans2
        }
//        if let incomeTax : Double = UserDefaults.standard.value(forKey: "lowerLimitShow") as! Double{
//            self.taxOnAccessAmount.text = String(incomeTax)
//        }
        
        var t = Int(first + second)
        self.totalTaxCalculated.text = String(t)
        
        var third = Double()
        if let rebateTax : Double = UserDefaults.standard.value(forKey: "rebateTaxalreadyPaid") as! Double{
            var t = Int(rebateTax)
            self.witholdingTax.text = String(t)
            third = rebateTax
        }
        
        var t2 = Int((first+second)-third)
        self.netTaxPayable.text = String(t2)
        netPayAbleText = (first+second)-third
        
        if let taxThroughSalary : Double = UserDefaults.standard.value(forKey: "taxAlreadyDeductedInSalary") as! Double{
            var t = Int(taxThroughSalary)
            self.taxAlreadyDeductedSalary.text = String(t)
            deductedSalary = taxThroughSalary
        }
        if let taxThroughIncome : Double = UserDefaults.standard.value(forKey: "taxAlreadyDeductedIncome") as! Double{
            var t = Int(taxThroughIncome)
            self.taxAlreadyDeductedIncome.text = String(t)
            deductedIncome = taxThroughIncome
        }
        
        var balanceAnswer = netPayAbleText - deductedSalary - deductedIncome
        
        if(balanceAnswer < 0){
            var t = Int(abs(balanceAnswer))
            self.balance.text = "( " + "\(t)" + " )"
        }
        else{
            var t = Int(balanceAnswer)
            self.balance.text = String(t)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
