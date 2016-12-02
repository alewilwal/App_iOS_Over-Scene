//
//  AgendaSonoreTableViewCell.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 30/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit
import AlamofireImage

class AgendaSonoreTableViewCell: UITableViewCell {

    @IBOutlet weak var ui_titleEventLabel: UILabel!
    @IBOutlet weak var ui_imageEventImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func display(event:Event) {
    
            ui_titleEventLabel.text = event.title
            //print("***************** \(event.imageURL!)")
            let fileUrl = Foundation.URL(string: event.imageURL!)
            ui_imageEventImageView.af_setImage(withURL: fileUrl!, placeholderImage: UIImage(named:"visuel-logo-white"))
            

    }
    
}
