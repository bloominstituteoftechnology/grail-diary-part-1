//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Vici Shaweddy on 7/29/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var poiTV: UITableView!
    
    var pois: [POI] = []

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
        
        else if segue.identifier == "ShowPOIDetailSegue" {
            guard let detailPOIVC = segue.destination as? POIDetailViewController,
                  let indexPath = poiTV.indexPathForSelectedRow else {
                return
            }

            let poi = pois[indexPath.row]
            detailPOIVC.poi = poi
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            return UITableViewCell()
        }
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        poiTV.reloadData()
    }
}
