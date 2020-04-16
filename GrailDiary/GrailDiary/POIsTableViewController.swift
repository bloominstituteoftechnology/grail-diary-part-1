//
//  ViewController.swift
//  GrailDiary
//
//  Created by Vincent Hoang on 4/14/20.
//  Copyright © 2020 Vincent Hoang. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController, UITableViewDataSource, AddPOIDelegate {
    var poiArray: [POI] = [POI]()
    var poiDelegate: AddPOIDelegate?
    
    @IBOutlet var poiTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        poiDelegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "POICell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? POITableViewCell else {
            fatalError("The dequeued cell is not an instance of POITableViewCell")
        }
        cell.poi = poiArray[indexPath.row]
        
        return cell
    }
    
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        poiTableView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "AddPOIModalSegue":
            guard let addPOIViewController = segue.destination as? AddPOIViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            addPOIViewController.delegate = self
        case "ShowPOIDetailSegue":
            guard let poiDetailViewController = segue.destination as? POIDetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPOICell = sender as? POITableViewCell else {
                fatalError("Unexpected ender: \(sender ?? "No sender available")")
            }
            
            guard let indexPath = poiTableView?.indexPath(for: selectedPOICell) else {
                fatalError("The selected cell is not being displayed by the table.")
            }
            
            let selectedPOI = poiArray[indexPath.row]
            poiDetailViewController.poi = selectedPOI
        default:
            fatalError("Unexpected segue identifier: \(segue.identifier ?? "No segue available")")
        }
    }
}
