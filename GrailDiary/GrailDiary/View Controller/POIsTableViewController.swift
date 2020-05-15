//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Bradley Yin on 7/17/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var POIs : [POI] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else {return}
            addPOIVC.delegate = self
        }
        if segue.identifier == "ShowPOIDetailSegue"{
            guard let poiDetailVC = segue.destination as? POIDetailViewController else {return}
            if let indexPath = tableView.indexPathForSelectedRow{
                 poiDetailVC.poi = POIs[indexPath.row]
            }
           
        }
    }

  

   
 

    
}

extension POIsTableViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else{return UITableViewCell()}
        let POI = POIs[indexPath.row]
        cell.POI = POI
        
        // Configure the cell...
        
        return cell
    }
}
extension POIsTableViewController : AddPOIDelegate{
    func poiWasCreated(poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    

}
