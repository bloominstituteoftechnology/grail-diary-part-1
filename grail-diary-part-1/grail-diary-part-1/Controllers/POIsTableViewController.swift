//
//  POIsTableViewController.swift
//  grail-diary-part-1
//
//  Created by Aaron on 7/30/19.
//  Copyright © 2019 AlphaGrade, INC. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    
    
    var POIs: [POI] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let vc = segue.destination as? AddPOIViewController {
                vc.delegate = self
            }
    }    else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow, let vc = segue.destination as? POIDetailViewController {
                vc.poi = POIs[indexPath.row]
            }
        }
    
        
        
    }
}

extension POIsTableViewController: UITableViewDataSource {
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowPOIDetailSegue") as? POITableViewCell else {return UITableViewCell()}
        
        let poi = POIs[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true)
        tableView.reloadData()
    }
 
}
