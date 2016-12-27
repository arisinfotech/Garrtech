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
    @IBOutlet var lblPer: UILabel!
    @IBOutlet var lblperValue: UILabel!
    var chart:VBPieChart!
    @IBOutlet var view_ChartUpper : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "SCORE BIZ"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        DispatchQueue.main.async {
            self.addChart()
            showHUD()
            APIManager.sharedInstance.ScoreBiz { (score:ScorBiz?, error:NSError?) in
                
                hideHUD()
                
                var chartValue: Int = 0
                
                if error == nil {
                    self.scoreBiz = score!
                    
                    if let annualRev = self.scoreBiz?.annualRevenue {
                        self.lblBusinesstime.text = annualRev.displayName!
                        if let value = annualRev.takenScore {
                            if value != ""{
                                chartValue = Int(value)!
                            }
                            
                        }
                    }
                    if let annualRev = self.scoreBiz?.businessTime {
                        self.lblAnnualrev.text = annualRev.displayName!
                        if let value = annualRev.takenScore {
                            if value != ""{
                                chartValue = chartValue + Int(value)!
                            }
                        }
                        
                    }
                    if let annualRev = self.scoreBiz?.craditScrore {
                        self.creditScore.text = annualRev.displayName!
                        if let value = annualRev.takenScore {
                            if value != ""{
                                chartValue = chartValue + Int(value)!
                            }
                        }
                        
                    }
                    if let annualRev = self.scoreBiz?.totalMonthlySale {
                        self.totalMonthlysale.text = annualRev.displayName!
                        if let value = annualRev.takenScore {
                            if value != ""{
                                chartValue = chartValue + Int(value)!
                            }
                        }
                    }
                    if let annualRev = self.scoreBiz?.propertyOwnerShip  {
                        self.propertyown.text = annualRev.displayName!
                        if let value = annualRev.takenScore {
                            if value != ""{
                                chartValue = chartValue + Int(value)!
                            }
                        }
                    }
                }
                self.setChart(value: chartValue)
            }
        }
        
        
        //self.setTranslucentOfNavigationBar(navCont: self.navigationController!)
        //self.setAppearanceOfNavigationBar(navCont: self.navigationController!)
        
        // self.view.setNeedsLayout()
        
        //        self.addChart()
        //
        //        self.setChart(value: 20)
        //
        //   return;
    }
    
    
    func addChart() {
        
        view_ChartUpper.backgroundColor = UIColor.clear
        chart = VBPieChart(frame: view_ChartUpper.frame)
        chart.frame = view_ChartUpper.frame
        chart.backgroundColor = UIColor.clear
        view.addSubview(chart)
        
        //  self.view.insertSubview(self.chart, at: 0)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        
    }
    
    func setChart(value:Int) {
        
        let remainValue = 100 - value
        lblPer.text = "\(value)"
        if value <= 20 {
            lblperValue.text = "LOW"
        } else if value <= 40 {
            lblperValue.text = "BELOW AVG."
        } else if value <= 60 {
            lblperValue.text = "AVERAGE"
        } else if value <= 80 {
            lblperValue.text = "GOOD"
        } else if value <= 100 {
            lblperValue.text = "EXCELLENT"
        }
        
        chart.length = M_PI
        chart.startAngle = M_PI
        chart.holeRadiusPrecent = 0.6
        chart.labelsPosition = .custom
        //UIColor.init(red: 205.0/255.0, green: 105.0/255.0, blue: 27.0/255.0, alpha: 1)
        chart.setChartValues([["name": "", "value": value, "color": UIColor.green], ["name": "", "value": remainValue, "color": UIColor.init(red: 236.0/255.0, green: 234.0/255.0, blue: 235.0/255.0, alpha: 1)]], animation: true, duration: 0.5, options: .fan)
        
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
