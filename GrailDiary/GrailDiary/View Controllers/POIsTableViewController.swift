//
//  ViewController.swift
//  GrailDiary
//
//  Created by Robert on 1/31/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    // Properties
    var pointsOfInterest: [POI] = []
    // Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.dataSource = self
    }
    // 2.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                //                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = pointsOfInterest[indexPath.row]
                
            }
            
            extension POIsTableViewController: UITableViewDataSource {
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return pointsOfInterest.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
                    
                    let poi = pointsOfInterest[indexPath.row]
                    cell.poi = poi
                    return cell
                }
                // 1.
                extension AddPOIViewController: AddPOIDelegate {
                    func poiWasAdded(_poi: POI) {
                        pointsOfInterest.append(_poi)
                        dismiss(animated: true)
                        tableView.reloadData()
                    }
                }
}
