//
//  MyApplicationListViewController.swift
//  Garrtech
//
//  Created by Ankit on 13/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class MyApplicationListViewController: UITableViewController {

    
    var myAppListArr = [MyApplication]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.doSetupView()
        
        if !Reachability.sharedInstance.isReachable() {
            return
        }
        showHUD()
        APIManager.sharedInstance.myApplications { (myAppArr:[MyApplication]?, error:NSError?) in
            hideHUD()
            if error == nil {
                
                if myAppArr!.count > 0 {
                    self.myAppListArr = myAppArr!
                    self.tableView.reloadData()
                } else {
                    Alert.displayErrorDevMessage(str: "No pending application.")
                }
            } else {
                Alert.displayErrorDevMessage(str: error!.localizedDescription)
            }
        }
    }
    
    func doSetupView() {
        self.title = "MY APPLICATION"
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        
        let footerView = UIView.init(frame: CGRect.zero)
        self.tableView.tableFooterView = footerView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.myAppListArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ApplicaitonCell
        
        
        cell.lblText?.text = self.myAppListArr[indexPath.row].loanName!
        cell.imageViewObj.image = #imageLiteral(resourceName: "loan_unselect")
        cell.imageViewObj.contentMode = .scaleAspectFit
        cell.imageViewObj.backgroundColor = UIColor.clear
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class ApplicaitonCell: UITableViewCell {
    @IBOutlet var imageViewObj: UIImageView!
    @IBOutlet var lblText: UILabel!
}
