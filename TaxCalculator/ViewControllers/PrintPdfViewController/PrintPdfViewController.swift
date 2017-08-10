//
//  PrintPdfViewController.swift
//  TaxCalculator
//
//  Created by user 1 on 09/08/2017.
//  Copyright © 2017 ahmad. All rights reserved.
//

import UIKit
import MessageUI

class PrintPdfViewController: UIViewController,  MFMailComposeViewControllerDelegate{

    @IBOutlet weak var webPreview: UIWebView!
    
    var HTMLContent = String()
    var pdfFilename = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let pathToInvoiceHTMLTemplate = Bundle.main.path(forResource: "invoice", ofType: "html")
        print(pathToInvoiceHTMLTemplate)
        
        do{
            var HTMLConten = try String(contentsOfFile: pathToInvoiceHTMLTemplate!)
            self.HTMLContent = HTMLConten
            self.replaceValues()
            self.webPreview.loadHTMLString(self.HTMLContent, baseURL:nil)
        }
        catch{
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Mark : Replace Html #Tags with the original values...
    func replaceValues(){
        var HtmlString = String()
        HtmlString = self.HTMLContent
        
        if let startYear : String = UserDefaults.standard.value(forKey: "fromYearSelected") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#startYear#", with: startYear)
            
            var str = "01.06."+"\(startYear)"
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#start#", with: str)
            
            
            let last2 = startYear.substring(from:startYear.index(startYear.endIndex, offsetBy: -2))
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#fromYear#", with: last2)
        }
        
        if let endYear : String = UserDefaults.standard.value(forKey: "toYearSelected") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#endYear#", with: endYear)
            
            var str = "30.06."+"\(endYear)"
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#end#", with: str)
            
            let last2 = endYear.substring(from:endYear.index(endYear.endIndex, offsetBy: -2))
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#toYear#", with: last2)
        }
        
        
        self.HTMLContent = HTMLContent.replacingOccurrences(of: "#startYear#", with: "2019")
        self.HTMLContent = HTMLContent.replacingOccurrences(of: "#endYear#", with: "2020")
        self.HTMLContent = HTMLContent.replacingOccurrences(of: "#start#", with: "01.06.2016")
        self.HTMLContent = HTMLContent.replacingOccurrences(of: "#end#", with: "30.06.2019")
        
        //now getting values for the 1st table to populate on the pdf screen
        
        
        if let grossSalary : String = UserDefaults.standard.value(forKey: "grossSalary") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#grossSalary#", with: grossSalary)
        }
        if let houseRentAllowance : String = UserDefaults.standard.value(forKey: "houseRentAllowance") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#HouseRentAllowance#", with: houseRentAllowance)
        }
        if let costOfFreeUnits : String = UserDefaults.standard.value(forKey: "costOfFreeUnits") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#CostFreeUnits#", with: costOfFreeUnits)
        }
        if let costOfUnconsumedUnits : String = UserDefaults.standard.value(forKey: "costOfUnconsumedUnits") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#CostUnconsumedUnits#", with: costOfUnconsumedUnits)
        }
        if let otherIncome : String = UserDefaults.standard.value(forKey: "otherIncome") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#otherIncome#", with: otherIncome)
        }
        if let donationDeducted : String = UserDefaults.standard.value(forKey: "donationDeducted") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#donationDeducted#", with: donationDeducted)
        }
        if let zakatDeducted : String = UserDefaults.standard.value(forKey: "zakatDeducted") as? String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#zakatDeducted#", with: zakatDeducted)
        }
        if let originalTax : Double = UserDefaults.standard.value(forKey: "TotalAmountForTax") as! Double?{
            var tax : String = String(originalTax)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#netTaxableIncome#", with: tax)

        }
        
        //end
        
        //Now for the 2nd table ,
        
        if let incomeTaxLowerLimit : Double = UserDefaults.standard.value(forKey: "lowerLimitShow") as! Double{
            var uptoTax = String(incomeTaxLowerLimit)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#uptoTax#", with: uptoTax)
        }
        if let netTaxableIncomeShow : Double = UserDefaults.standard.value(forKey: "incomeTaxShow") as! Double{
            var uptoTaxAmount = String(netTaxableIncomeShow)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#taxUptoAmount#", with: uptoTaxAmount)
        }
        if let percentage : Double = UserDefaults.standard.value(forKey: "percentageShow") as! Double{
            var str = "\(percentage)"
            var percent = str
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#excessPercent#", with: percent)
        }
        if let percentTaxShow : Double = UserDefaults.standard.value(forKey: "taxOnAccessAmount") as! Double{
            var taxOnAccessAmount = String(percentTaxShow)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#excessAmount#", with: taxOnAccessAmount)
        }
        if let totalTaxCalculated : Int = UserDefaults.standard.value(forKey: "totalTaxCalculated") as! Int{
            var totalTax = String(totalTaxCalculated)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#totalTax#", with: totalTax)
        }
        if let witholdingTax : Int = UserDefaults.standard.value(forKey: "witholdingTax") as! Int{
            var wTax = String(witholdingTax)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#rebateTax#", with: wTax)
        }
        if let netTaxPayable : Int = UserDefaults.standard.value(forKey: "netTaxPayable") as! Int{
            var netTax = String(netTaxPayable)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#netTaxPayable#", with: netTax)
        }
        if let taxAlreadyDedcutedSalary : Int = UserDefaults.standard.value(forKey: "taxAlreadyDeductedSalary") as! Int{
            var taxSalary = String(taxAlreadyDedcutedSalary)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#taxDeductedSalary#", with: taxSalary)
        }
        if let taxAlreadyDedcutedIncome : Int = UserDefaults.standard.value(forKey: "taxAlreadyIncome") as! Int{
            var taxSalaryIncome = String(taxAlreadyDedcutedIncome)
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#taxDeductedIncome#", with: taxSalaryIncome)
        }
        if let balance : String = UserDefaults.standard.value(forKey: "totalBalance") as! String{
            self.HTMLContent = HTMLContent.replacingOccurrences(of: "#balance#", with: balance)
        }
        
        //end
        
//        self.HTMLContent = HtmlString
    }
    
    //end
    
    //Mark : Function to export the html file as pdf **********************
    func exportHTMLContentToPDF(HTMLContent: String) {
        let printPageRenderer = CustomPrintPageRenderer()
        
        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        
        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
        
        
        self.pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/TaxFile.pdf"
        pdfData?.write(toFile: self.pdfFilename, atomically: true)
        
        print(pdfFilename)
        
        
        //now calling to email
        
        self.sendEmail()
    }
    
    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
        let data = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
        
        UIGraphicsBeginPDFPage()
        
        printPageRenderer.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
        
        UIGraphicsEndPDFContext()
        
        return data
    }
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setSubject("")
            mailComposeViewController.setToRecipients(["ahmadrafiqbscs@gmail.com"])
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.addAttachmentData(NSData(contentsOfFile: self.pdfFilename)! as Data, mimeType: "application/pdf", fileName: "TaxFile")
            present(mailComposeViewController, animated: true, completion: nil)
        }
    }
    
    //Mark : Mail Comose delegate functions
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("finsih method")
        
        print(result)
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .sent:
            print("sent")
        default:
            print("default")
        }
        
        controller.dismiss(animated: true)
    }

    
    //end
    
    @IBAction func sendPdfAsEmail(_ sender: UIButton) {
        self.exportHTMLContentToPDF(HTMLContent: self.HTMLContent)
    }
    
    //end ******************************************************************

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
