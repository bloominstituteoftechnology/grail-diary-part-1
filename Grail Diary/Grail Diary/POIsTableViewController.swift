//
//  ViewController.swift
//  Grail Diary
//
//  Created by Kelson Hartle on 4/14/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableViewPOIList: UITableView!
    
    var pointsOfInterest: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPOIList.delegate = self
        tableViewPOIList.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addPOIVC = segue.destination as? AddPOIViewController {
            
            addPOIVC.delegate = self
            
        }
       else if let poiDetailVC = segue.destination as? POIDetailViewController {
            if let indexPath = tableViewPOIList.indexPathForSelectedRow {
                poiDetailVC.poi = pointsOfInterest[indexPath.row]

            }
        }
        
    }
}



extension POIsTableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pointsOfInterest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowPoIDetailSegue") as? POITableViewCell else { fatalError("Cell Identifier is wrong.")}
        
        let pointOfInterest = pointsOfInterest[indexPath.row]
        cell.poi = pointOfInterest
        
        return cell
    }
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
        pointsOfInterest.append(poi)
        
        dismiss(animated: true, completion: nil)
        
        tableViewPOIList.reloadData()
        
    }
    
    
}


