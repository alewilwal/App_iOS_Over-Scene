//
//  EventViewController.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var ui_eventLabel: UILabel!
    @IBOutlet weak var ui_eventDescriptionTextView: UITextView!
    @IBOutlet weak var ui_eventImageView: UIImageView!
    
    var _event:Event?
    
    override func viewWillAppear(_ animated: Bool) {
        if let event = _event {
            ui_eventLabel.text = event.title
            ui_eventDescriptionTextView.text = event.content
            let fileUrl = Foundation.URL(string: event.imageURL!)
            ui_eventImageView.af_setImage(withURL: fileUrl!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
