//
//  POIsViewController.swift
//  GrailDiary
//
//  Created by Aaron Peterson on 4/10/20.
//  Copyright © 2020 Aaron Peterson. All rights reserved.
//

import UIKit

class POIsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var POIs = [POI]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addVC = segue.destination as? AddPOIViewController {
                addVC.delegate = self
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let detailVC = segue.destination as? POIDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                    let poi = POIs[indexPath.row]
                    detailVC.poi = poi
                }
                
            }
        }
    }


}

extension POIsViewController: UITableViewDataSource {
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

extension POIsViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}

