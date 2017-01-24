//
//  cellDocument.swift
//  Garrtech
//
//  Created by GovindRavaliya on 16/01/17.
//  Copyright © 2017 Ankit. All rights reserved.
//

import UIKit

class cellDocument: UICollectionViewCell {

    
    @IBOutlet var img_View : UIImageView? = UIImageView()
    @IBOutlet var btn_RemoveImage : UIButton? = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setTagAndImage(Tag: NSInteger , img: UIImage) {
        
        img_View?.image = img;
    }
    @IBAction func btn_RemoveImage(_ sender: AnyObject) {
        
        
        
    }
    
}
