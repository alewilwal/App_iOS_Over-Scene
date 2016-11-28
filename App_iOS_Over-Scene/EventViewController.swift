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
    var _event:Event?
    
    override func viewWillAppear(_ animated: Bool) {
        if let event = _event {
            ui_eventLabel.text = event.name
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
