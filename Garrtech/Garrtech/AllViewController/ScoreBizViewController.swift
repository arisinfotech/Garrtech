//
//  ScoreBizViewController.swift
//  Garrtech
//
//  Created by Ankit on 25/12/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class ScoreBizViewController: BaseViewController {

    var scoreBiz: ScorBiz?
    @IBOutlet var lblAnnualrev: UILabel!
    @IBOutlet var lblBusinesstime: UILabel!
    @IBOutlet var creditScore: UILabel!
    @IBOutlet var totalMonthlysale: UILabel!
    @IBOutlet var propertyown: UILabel!
    @IBOutlet var chart:VBPieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "SCORE BIZ"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        
       // self.view.setNeedsLayout()
        
        showHUD()
        APIManager.sharedInstance.ScoreBiz { (score:ScorBiz?, error:NSError?) in
            hideHUD()
            
            if error == nil {
                self.scoreBiz = score!
                
                if let annualRev = self.scoreBiz?.annualRevenue {
                    self.lblAnnualrev.text = annualRev.displayName!
                }
                if let annualRev = self.scoreBiz?.businessTime {
                    self.lblAnnualrev.text = annualRev.displayName!
                }
                if let annualRev = self.scoreBiz?.craditScrore {
                    self.lblAnnualrev.text = annualRev.displayName!
                }
                if let annualRev = self.scoreBiz?.totalMonthlySale {
                    self.lblAnnualrev.text = annualRev.displayName!
                }
                if let annualRev = self.scoreBiz?.propertyOwnerShip  {
                    self.lblAnnualrev.text = annualRev.displayName!
                }
            }
            
            self.setChart(value: 20)
            
            
        }
        
    }

    func setChart(value:Int) {
    
        let remainValue = 100 - value
        
      //  chart.frame = CGRect(x: 10, y: 50, width: 300, height: 300)
        chart.length = M_PI
        chart.startAngle = M_PI
        chart.holeRadiusPrecent = 0.6
        chart.labelsPosition = .custom
        chart.setChartValues([["name": "first", "value": value, "color": UIColor.green], ["name": "second", "value": remainValue, "color": UIColor.red]], animation: true, duration: 0.5, options: .fan)
        
        
        
        
    
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
