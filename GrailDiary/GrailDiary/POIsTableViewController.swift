//
//  ViewController.swift
//  GrailDiary
//
//  Created by Mark Gerrior on 2/18/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var poi: [POI] = [POI(location: "Aulani",
                          country: "US",
                          clues: ["Hawaii", "Disney"])]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else {return}
            addPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let showDetailVC = segue.destination as? POIDetailViewController else {return}
            
            guard let indexPath = self.tableView.indexPathForSelectedRow else { return }

            let poi = self.poi[indexPath.row]
            
            showDetailVC.poi = poi
        }
    }
}


extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell") as? POITableViewCell else { return UITableViewCell() }
        
        cell.poi = poi[indexPath.row]
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        self.poi.append(poi)

        tableView.reloadData()
    }
}
