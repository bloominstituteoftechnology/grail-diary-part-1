//
//  POIsTableViewController.swift
//  GrailDiaryPart1-AutoLayout
//
//  Created by Lisa Fisher on 7/30/19.
//  Copyright © 2019 Lisa Fisher. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            } else {
                if segue.identifier == "ShowPOIDetailSegue" {
                    guard let indexPath = tableView.indexPathForSelectedRow,
                        let detailVC = segue.destination as? POIDetailViewController
                        else { return }
                    let poi = pois[indexPath.row]
                    detailVC.poi = poi
                }
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
    func poiWasCreated(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
