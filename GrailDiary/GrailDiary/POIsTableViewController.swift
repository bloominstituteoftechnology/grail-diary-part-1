//
//  ViewController.swift
//  GrailDiary
//
//  Created by Norlan Tibanear on 5/21/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
      var places = [POI]()
//    var places: [POI] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalsegue" {
            if let addPOIVC = segue.destination as? AddPOIVC {
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailsVC = segue.destination as? POIDetailVC {
                poiDetailsVC.poi = places[indexPath.row]
            }
        }
        
        
    } //
    

} // END

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POIsTableViewCell else { return UITableViewCell() }
        
        let newPlace = places[indexPath.row]
        cell.poi = newPlace
//        cell.delegate = self

        
        return cell
    }
} //

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        places.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
} //

