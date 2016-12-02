//
//  AgendaSonoreTableViewController.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import ObjectMapper
import AlamofireObjectMapper

class AgendaSonoreTableViewController: UITableViewController {
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    var eventsArray:[Event]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let _tribeEventCat:String = "Musique"
        
        let URL = "http://www.over-scene.com/wp-json/posts?type=tribe_events&filter[tribe_events_cat]=\(_tribeEventCat)"
        
        Alamofire.request(URL).responseArray { (response: DataResponse<[Event]>) in
            self.eventsArray = response.result.value
            self.tableView.reloadData()
            //print(self.eventsArray[0].title)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let event = eventsArray {
            return event.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AgendaSonoreTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell-event", for: indexPath) as! AgendaSonoreTableViewCell
        let event:Event = eventsArray[indexPath.row]
        //cell.ui_titleEventLabel!.text = event.title
        cell.display(event: event)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail-event" {
            if let cell = sender as? UITableViewCell {
                if let indexPath = self.tableView.indexPath(for: cell) {
                    let selectedEvent = eventsArray[indexPath.row]
                    let EventViewController:EventViewController = segue.destination as! EventViewController
                    EventViewController._event = selectedEvent
                }
            }
        }
    }

}
