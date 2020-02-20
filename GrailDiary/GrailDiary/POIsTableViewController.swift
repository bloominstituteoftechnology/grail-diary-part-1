//
//  ViewController.swift
//  GrailDiary
//
//  Created by Bradley Diroff on 2/18/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var POIarray = [POI]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPoiVC = segue.destination as? AddPOIViewController else {return}
            addPoiVC.delegate = self
        } else {
            if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = myTableView.indexPathForSelectedRow, let poiDetailVC = segue.destination as? POIDetailViewController {
                    let newPoi = POIarray[indexPath.row]
                    poiDetailVC.poi = newPoi
                }
            }
        }
        
    }


}

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
        
        let poi = POIarray[indexPath.row]
        cell.poi = poi
        
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        POIarray.append(poi)
        myTableView.reloadData()
    }
}
