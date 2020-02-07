//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Claudia Contreras on 2/6/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    //to store the POI models
    var pois: [POI] = []

    //IBOutlets
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

//MARK: - Extensions

extension POIsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        //cell.poi = poi
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.description == "AddPOIModalSegue" {
            let addPOIVC = segue.destination as! AddPOIViewController
            addPOIVC.delegate = self
        }
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        self.pois.append(poi)
        tableView.reloadData()
    }
    
    
}
