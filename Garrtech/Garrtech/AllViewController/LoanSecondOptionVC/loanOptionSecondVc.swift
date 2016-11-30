//
//  loanOptionSecondVc.swift
//  Graytech
//
//  Created by Pratik kukadiya on 11/19/16.
//  Copyright © 2016 Pratik kukadiya. All rights reserved.
//

import UIKit

class loanOptionSecondVc: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{

    @IBOutlet var collectionviewObj: UICollectionView!
    let reuseIdentifier = "loanOption"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8"]
    var SelectedIndex = NSInteger()
    @IBOutlet var viewHead : UIView!
    
    @IBOutlet var leadingConstraintOfScrollview: NSLayoutConstraint!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.doSetUpScreen()
    
       
    }
    
    func doSetUpScreen()  {
        
  
        self.setLeftSideButtonWithImage(Name: "back", selector:#selector(self.popTo))
        
        collectionviewObj.dataSource=self
        collectionviewObj.delegate=self
        SelectedIndex=0;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionviewObj.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! loanOption
        
        if indexPath.item==SelectedIndex
        {
            cell.viewLine?.backgroundColor=UIColor.init(colorLiteralRed: 118.0/255.0, green: 124.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        }
        else
        {
             cell.viewLine?.backgroundColor=UIColor.white
        }
        
        cell.lbltitle?.text=self.items[indexPath.item]

        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
            return CGSize(width: collectionviewObj.frame.size.width/8, height: collectionviewObj.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
         SelectedIndex=indexPath.item
        collectionviewObj.reloadData()
    }
    
    
    //MARK: - Button Click Event -
    
    @IBAction func btnNextPreviousClick(_ sender: AnyObject)
    {
        if sender.tag==1
        {
            
          //  leadingConstraintOfScrollview
            
            if SelectedIndex>0
            {
                SelectedIndex=SelectedIndex-1;
                collectionviewObj.reloadData()
            }
        }
        else
        {
            if SelectedIndex < items.count-1
            {
                self.SelectedIndex=SelectedIndex+1;
                 collectionviewObj.reloadData()
            }
        }
        
       
    }
    

}
