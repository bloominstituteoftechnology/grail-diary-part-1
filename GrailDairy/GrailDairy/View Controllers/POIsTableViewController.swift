//
//  ViewController.swift
//  GrailDairy
//
//  Created by Juan M Mariscal on 1/30/20.
//  Copyright © 2020 Juan M Mariscal. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var poiArray: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}
    extension POIsTableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return poiArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
            
            let poiLocation = poiArray[indexPath.row]
            
            cell.poi = poiLocation
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                let addPOIVC = segue.destination as! AddPOIViewController
                
                addPOIVC.delegate = self
            } else if segue.identifier == "ShowPOIDetailSegue" {
                let showPOIVC = segue.destination as! POIDetailViewController, indexPath = tableView.indexPathForSelectedRow
                let poi = poiArray[(indexPath?.row ?? nil)!]
                showPOIVC.poi = poi
                
            }
        }
        
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ location: POI){
        poiArray.append(location)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
        
}



