//
//  ViewController.swift
//  GrailDiary
//
//  Created by Bryan Cress on 5/12/20.
//  Copyright © 2020 Bryan Cress. All rights reserved.
//
import UIKit

class POIsTableViewController: UIViewController {
  
    
    
    
    @IBOutlet weak var POIsTableView: UITableView!
    
    
    var POImodels: [POI] = [POI(location: "Moscow", country: "Russia", clues: ["Government Capital Buildings"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        POIsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            
            let POIVC = segue.destination as? AddPOIViewController
            
            
            POIVC?.delegate = self
        }
    }
}



extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POImodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell identifier is wrong or the cell is not of expected type POITabelViewCell")
        }
         return cell
    }
}


extension POIsTableViewController: AddPOIDelegate {
    
    func POIWasAdded(poi: POI) {
        POImodels.append(poi)
        dismiss(animated: true, completion: nil)
        POIsTableView.reloadData()
    }
}

