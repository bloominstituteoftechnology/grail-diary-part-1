//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Lambda_School_Loaner_101 on 7/30/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let detailVC = segue.destination as? POIDetailViewController {
                    
                    
                   let detailCell = pois[indexPath.row]
                    detailVC.poi = detailCell
                    
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrailDiaryCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell 
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
