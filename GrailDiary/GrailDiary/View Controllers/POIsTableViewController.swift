//
//  ViewController.swift
//  GrailDiary
//
//  Created by Shawn James on 2/18/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class POIsTableViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let unwrap = segue.destination as? AddPOIViewController else { return }
            unwrap.delegate = self
        } else {
            if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow, let poiDetailVC = segue.destination as? POIDetailViewController {
                    let newPOI = poiArray[indexPath.row]
                    poiDetailVC.poi  = newPOI
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell()}
        
        let poi = poiArray[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var poiArray: [POI] = []
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        tableView.reloadData()
    }
    
    
}
