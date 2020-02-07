//
//  POIsTableViewController.swift
//  Grail-Diary
//
//  Created by Breena Greek on 1/31/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var CustomTableView: UITableView!
    
    var POIArray: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension POIsTableViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POIContentCell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = POIArray[indexPath.row]
        cell.poi = poi
        return cell
    }



    // #2
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIModalVC = segue.destination as? AddPOIViewController {
                addPOIModalVC.delegate = self
                
            }
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = CustomTableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? POIDetailViewController {
                detailVC.poi = POIArray[indexPath.row]
            }
        }
    }
}
// #1

extension POIsTableViewController: AddPOIDelegate {
    func poiWasCreated(_ poi: POI) {
        POIArray.append(poi)
        dismiss(animated: true, completion: nil)
        CustomTableView.reloadData()
        }
    }

