//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Elizabeth Thomas on 1/30/20.
//  Copyright © 2020 Libby Thomas. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var POIs: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
           
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                if let addPOIVC = segue.destination as? AddPOIViewController {
                     addPOIVC.delegate = self
                }
                    
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let detailVC = segue.destination as? POIDetailViewController {
                    detailVC.poi = POIs[indexPath.row]
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
        
    }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
            
            let poi = POIs[indexPath.row]
            cell.poi = poi
            return cell
            
        }
}

extension POIsTableViewController: AddPOIDelegate {
    func POIWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
