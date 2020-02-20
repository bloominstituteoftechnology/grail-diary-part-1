//
//  ViewController.swift
//  GrailDiary
//
//  Created by Wyatt Harrell on 2/18/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            guard let AddPOIVC = segue.destination as? AddPOIViewController else { return }
            
            AddPOIVC.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let POIDetailVC = segue.destination as? POIDetailViewController, let selectedRow = tableView.indexPathForSelectedRow {
                POIDetailVC.poi = pois[selectedRow.row]
            }
            
            
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        
        // MARK: - NEED TO DO
        // NEED TO DO NUMBER 10 AND 11
        
        return cell
    }

}



extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        tableView.reloadData()
    }
}
