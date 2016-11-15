//
//  HomeViewController.swift
//  Garrtech
//
//  Created by GovindRavaliya on 14/11/16.
//  Copyright © 2016 Ankit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {

    @IBOutlet var collectionViewObj: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        appDelegate.navigationVC?.navigationBar.isHidden = false
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
//        self.navigationController?.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.title = "GARRTECH FUND"
        
        collectionViewObj.dataSource = self
        collectionViewObj.delegate = self
//        collectionViewObj!.register(HomwViewCell.self, forCellWithReuseIdentifier: "HomwViewCell")

//        collectionViewObj.register(HomwViewCell.classForCoder(), forCellWithReuseIdentifier: "HomwViewCell")
        // Do any additional setup after loading the view.
        
//        9998882910
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionViewObj.dequeueReusableCell(withReuseIdentifier: "HomwViewCell", for: indexPath) as! HomwViewCell
        cell.lblNameObj.text = "NEW APPLICATION"
        
        
        return cell
    }

    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width = (UIScreen.main.bounds.width / 2 ) - 20
        return CGSize(width: width, height: width)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "PushToForm", sender: nil)
//        let cell = collectionViewObj.cellForItem(at: indexPath)
//        
//        cell?.backgroundColor = UIColor.RGB(R: 115, G: 122, B: 133, A: 1.0)
        
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
