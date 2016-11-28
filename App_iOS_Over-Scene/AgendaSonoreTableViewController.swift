//
//  AgendaSonoreTableViewController.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class AgendaSonoreTableViewController: UITableViewController {
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    var _eventsArray:[Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        _eventsArray.append(Event(name: "Maths", note: 15))
        _eventsArray.append(Event(name: "Français", note: 10))
        _eventsArray.append(Event(name: "Histoire", note: 12))
        _eventsArray.append(Event(name: "Anglais", note: 14))
        _eventsArray.append(Event(name: "Espagnole", note: 16))
        _eventsArray.append(Event(name: "Informatique", note: 18))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _eventsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell-event")
        let event:Event = _eventsArray[indexPath.row]
        
        if let label = cell.textLabel {
            label.text = event.name
        }
        
        if let detailLabel = cell.detailTextLabel {
            detailLabel.text = "\(event.note)"
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail-event" {
            if let cell = sender as? UITableViewCell {
                if let indexPath = self.tableView.indexPath(for: cell) {
                    let selectedEvent = _eventsArray[indexPath.row]
                    
                    let EventViewController:EventViewController = segue.destination as! EventViewController
                    EventViewController._event = selectedEvent
                }
            }
        }
    }

}
