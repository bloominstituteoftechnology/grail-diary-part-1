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
        default:
            fatalError("An unknown segue was encountered: \(segue.identifier ?? "<No ID>")")
        }
    }

}
// ?? #11 Wire up the delegate property of the tableview in the storyboard to the view controller
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POIcell", for: indexPath) as? POITableViewCell else {
            fatalError()
        }
        
//        let poi = pois[indexPath.row]
//        cell.poi = poi
        
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
