//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Lambda_School_Loaner_141 on 7/30/19.
//  Copyright © 2019 Jordan Skenandore. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var pOI: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
        else if segue.identifier == "ShowPOIDetailSegue" {
            if let POIDetailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                
                POIDetailVC.poi = pOI[indexPath.row]
                
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pOI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POI Cell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let location = pOI[indexPath.row]
        cell.pointOfInterest = location
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pOI.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
