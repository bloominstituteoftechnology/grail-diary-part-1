//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by macbook on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var POIs: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            }
                
        } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = POIs[indexPath.row]
                }
            }
            
        } 
        
    }



// Extension to conform to the UITableViewDataSource protocol
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


// Extension to conform to the AddPOIDelegateprotocol
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
}

