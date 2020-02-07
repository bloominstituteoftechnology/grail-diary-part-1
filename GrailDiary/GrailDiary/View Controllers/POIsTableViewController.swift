//
//  ViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_259 on 1/30/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    // MARK: Properties
    var pois: [POI] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var poiTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.poiTableView.delegate = POIsTableViewController
        //self.poiTableView.datasource = POIsTableViewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            let addPOIVC = segue.destination as? AddPOIViewController
            addPOIVC?.delegate = self
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = poiTableView.indexPathForSelectedRow?.row, let showPOIVC = segue.destination as? POIDetailViewController {
                showPOIVC.poi = pois[indexPath]
            }
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true)
        poiTableView.reloadData()
    }
}



