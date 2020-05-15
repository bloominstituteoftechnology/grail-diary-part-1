//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Jonalynn Masters on 9/12/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController {
                poiDetailVC.poi = POIs[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
        let poi = POIs[indexPath.row]
        cell.poi = poi 
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ POI: POI) {
        POIs.append(POI)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
