//
//  ViewController.swift
//  GrailDiary
//
//  Created by Enzo Jimenez-Soto on 4/14/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var poiArray: [POI] = [POI(location: "Yosemite", country: "USA", clues: ["Half-Dome", "El Capitan", "Cathedral Rocks"])]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 11 Done?
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            guard let addPOIVC = segue.destination as? AddPOIViewController else {return}
            // sets up the TVC as the delegate or employee of the add friend view controller
            addPOIVC.delegate = self
        }
        
        else if segue.identifier == "ShowPOIDetailSegue" {
            guard let detailVC = segue.destination as? POIDetailViewController else {return}
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let poi = poiArray[indexPath.row]
                // will call updateViews because of didSet
                detailVC.poi = poi
            }

        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}

        //10. NOT DONE NEEDS tableviewcell file first
extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poiArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {fatalError()}

        let poi = poiArray[indexPath.row]
        cell.poi = poi
        return cell
    }

}

// 22-24
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(poi: POI) {
        poiArray.append(poi)
        tableView.reloadData()
    }
}

