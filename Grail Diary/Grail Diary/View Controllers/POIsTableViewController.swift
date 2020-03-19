//
//  ViewController.swift
//  Grail Diary
//
//  Created by Harmony Radley on 3/17/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    var pois = [POI]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }


}

// Outside of class

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
            "POICell", for: indexPath) as?
            POITableViewCell else {
                fatalError("Cell is not a POITableViewCell")
        }
        
        let poi = pois[indexPath.row]
        
        
        
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
    
    
}
