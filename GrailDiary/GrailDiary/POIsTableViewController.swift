//
//  ViewController.swift
//  GrailDiary
//
//  Created by John McCants on 5/19/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit


class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    
    var poiArray : [POI] = []
    
    @IBOutlet weak var poiTableView: UITableView!
    var delegate : AddPOIDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//        poiTableView.delegate = self
//        poiTableView.dataSource = self
        poiArray.append(POI(location: "New York", country: "USA", clues: ["Mets", "Yankees", "Jets"]))
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let destinationAddVC = segue.destination as? AddPOIViewController {
                destinationAddVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
            if let destinationShowVC = segue.destination as? POIDetailViewController ,
            let indexPath = poiTableView.indexPathForSelectedRow {
                
                let poiInfo = poiArray[indexPath.row]
                destinationShowVC.poi = poiInfo
            }
            }
    }

}

extension POIsTableViewController : UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.poiArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell {
        
        self.poiTableView = tableView
            let poi = poiArray[indexPath.row]
            cell.poi = poi
        return cell
        
    }
               
           
               return UITableViewCell()
    }
    
  

}

extension POIsTableViewController : AddPOIDelegate {
    
func poiWasAdded(_ poi: POI) {
    
    poiArray.append(poi)
    
    dismiss(animated: true, completion: nil)
    
    poiTableView.reloadData()
}
    
}

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}
