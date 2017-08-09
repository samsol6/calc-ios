//
//  ResultScreenViewController.swift
//  TaxCalculator
//
//  Created by user 1 on 03/08/2017.
//  Copyright © 2017 ahmad. All rights reserved.
//

import UIKit
import QuartzCore
import MessageUI
import MobileCoreServices

class ResultScreenViewController: UIViewController, MFMailComposeViewControllerDelegate {

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

    @IBAction func savePdf(_ sender: UIButton) {
        createPdfFromView(aView: self.view, saveToDocumentsWithFileName: "myFile.pdf")
    }
    
    func createPdfFromView(aView: UIView, saveToDocumentsWithFileName aFilename: String)
    {
        // Creates a mutable data object for updating with binary data, like a byte array
//        NSMutableData *pdfData = [NSMutableData data];
//        
//        // Points the pdf converter to the mutable data object and to the UIView to be converted
//        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
//        UIGraphicsBeginPDFPage();
//        CGContextRef pdfContext = UIGraphicsGetCurrentContext();
//        
//        
//        // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
//        
//        [aView.layer renderInContext:pdfContext];
//        
//        // remove PDF rendering context
//        UIGraphicsEndPDFContext();
//        
//        // Retrieves the document directories from the iOS device
//        NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
//        
//        NSString* documentDirectory = [documentDirectories objectAtIndex:0];
//        NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
//        
//        // instructs the mutable data object to write its context to a file on disk
//        [pdfData writeToFile:documentDirectoryFilename atomically:YES];
//        NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
        
        
        //swift 2.1 code
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        aView.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName = documentDirectories + "/" + aFilename
            debugPrint(documentsFileName)
            pdfData.write(toFile: documentsFileName, atomically: true)
        }
    }
    @IBAction func sendEmail(_ sender: UIButton) {
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName : String = documentDirectories + "/" + "myFile.pdf"
            debugPrint(documentsFileName)
            
            
            //new code for sending email
            if MFMailComposeViewController.canSendMail() {
                let composer = MFMailComposeViewController()
                composer.mailComposeDelegate = self
                composer.setToRecipients([""])
                composer.setMessageBody("Body", isHTML: false)
                composer.setSubject("Subject")
                let attachmentData = NSData(contentsOfFile: documentsFileName)
//                let mimetype = self.mimeTypefrom(filePath: documentsFileName)
                let mimetype = "application/pdf"
//                composer.addAttachmentData(attachmentData! as Data, mimeType: mimetype, fileName: documentsFileName)
                composer.addAttachmentData(attachmentData! as Data, mimeType: mimetype, fileName: "MyTaxResult.pdf")
                self.present(composer, animated: true, completion: nil)
            } else {
                let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Check your mail configurations", delegate: self, cancelButtonTitle: "OK")
                sendMailErrorAlert.show()
            }
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("finsih method")
        controller.dismiss(animated: true)
    }
    
//    func mimeTypefrom(filePath: String) -> String {
//        
//        let fileExtension = filePath.pathExtension;
//        let UTI =  UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension, nil)
//        let mimeType = UTTypeCopyPreferredTagWithClass(UTI!.takeUnretainedValue(), kUTTagClassMIMEType);
//        return (mimeType?.takeRetainedValue())! as String
//    }
    
//    func exportHTMLContentToPDF(HTMLContent: String) {
//        var pdfFilename = String()
//        let printPageRenderer = CustomPrintPageRenderer()
//        
//        let printFormatter = UIMarkupTextPrintFormatter(markupText: HTMLContent)
//        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
//        
//        let pdfData = drawPDFUsingPrintPageRenderer(printPageRenderer: printPageRenderer)
//        
//        pdfFilename = "\(AppDelegate.getAppDelegate().getDocDir())/Invoice\("myFile").pdf"
//        pdfData?.write(toFile: pdfFilename, atomically: true)
//        
//        print(pdfFilename)
//    }
//    
//    func drawPDFUsingPrintPageRenderer(printPageRenderer: UIPrintPageRenderer) -> NSData! {
//        let data = NSMutableData()
//        
//        UIGraphicsBeginPDFContextToData(data, CGRect.zero, nil)
//        
//        UIGraphicsBeginPDFPage()
//        
//        printPageRenderer.drawPage(at: 0, in: UIGraphicsGetPDFContextBounds())
//        
//        UIGraphicsEndPDFContext()
//        
//        return data
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
