//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by brian vilchez on 7/18/19.
//  Copyright © 2019 brian vilchez. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    var pois: [POI] = []
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let AddPOIVC = segue.destination as? AddPOIViewController else {return}
            AddPOIVC.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            guard let indexPath = tableview.indexPathForSelectedRow,
                let POIDetailVC = segue.destination as? POIDetailViewController else {return}
            POIDetailVC.poi = pois[indexPath.row]
        }
    }
    
    
}

extension POIsTableViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    
    
    
}

extension POIsTableViewController: addPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableview.reloadData()    }
    
    

}
