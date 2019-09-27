//
//  POIsTableViewController.swift
//  GrailDairy
//
//  Created by denis cedeno on 9/26/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case "AddPOIModalSegue":
            guard let addPoiVC = segue.destination as? AddPOIViewController else { fatalError() }
            
            addPoiVC.delegate = self
            
        case "ShowPOIDetailSegue":
            guard let indexPath = tableView.indexPathForSelectedRow,
                let showPoiDetailVC = segue.destination as? POIDetailViewController else { fatalError() }
            
            showPoiDetailVC.poi = pois[indexPath.row]

        default:
            fatalError("An unknown segue was encountered: \(segue.identifier ?? "<No ID>")")
        }
    }

}

extension POIsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError()
        }
        
        
        cell.poi = pois[indexPath.row]
        
        return cell
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate{
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
    
    
}
