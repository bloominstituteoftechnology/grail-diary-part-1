//
//  POIsTableViewController.swift
//  GrailDairyDani
//
//  Created by Danielle Blackwell on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiProperty: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddPOIModalSegue" {
        if let addPoiVC = segue.destination as? AddPOIViewController {
            addPoiVC.delegate = self
        }
    } else if segue.identifier == "ShowGrailDetail" {
        if let indexPath = tableView.indexPathForSelectedRow,
            let PoiDetailVC = segue.destination as? POIDetailViewController {
            PoiDetailVC.poi = poiProperty[indexPath.row]
        }
    }
}



}
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiProperty.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}




    extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiProperty.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailDiaryCell", for: indexPath) as? POITableViewCell else { return UITableViewCell () }
        
        let poi = poiProperty[indexPath.row]
        cell.poi = poi

        return cell
    }
}
