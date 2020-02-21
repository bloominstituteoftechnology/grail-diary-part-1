//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Harmony Radley on 2/20/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var poi: [POI] = [POI(location: "Montana",
                          country: "USA",
                          clues: ["Mountains", "Horses"])]
    
    func poiWasCreated(poi: POI) {
        poi.append(poi)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            
            guard let addPOIVC = segue.destination as? AddPOIViewController else { return }
            
            addPOIVC.delegate = self
        }
    }
    
    if segue.identifier == "ShowPOIDetailSegue" {
    
    guard let showPOIS = segue.destination as? POIDetailViewController else { return }
    
    showPOIS.delegate = POI
    }
}

    
    

    
