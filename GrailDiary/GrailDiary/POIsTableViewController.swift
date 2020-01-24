//
//  ViewController.swift
//  GrailDiary
//
//  Created by Chris Gonzales on 1/21/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(pOIs.count)
        return pOIs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POITableViewCell", for: indexPath) as? POITableViewCell else{return UITableViewCell()}
        let poiCell = pOIs[indexPath.row]
        cell.poi = poiCell
        print(pOIs.count)
        return cell
    }
    
}

extension POIsTableViewController: AddPOIDelegate{
    func poiWasAdded(_ poi: POI) {
        pOIs.append(poi)
        dismiss(animated: true, completion: nil)
        //        guard let tableView = pOITableView else { return }
    }
}

class POIsTableViewController: UIViewController {
    
    //    var pOIs: [POI] = []
    var pOIs = [POI]()
    
    @IBOutlet weak var pOITableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue"{
            if let addPOIVC = segue.destination as? AddPOIViewController{
                addPOIVC.delegate = self
            }
        } else if segue.identifier == "ShowPOIDetailSegue"{
            if let indexPath = pOITableView.indexPathForSelectedRow,
                let pOIDetailVC = segue.destination as? POIDetailViewController{
                let poi = pOIs[indexPath.row]
                pOIDetailVC.poi = poi
            }
        }
        
    }
}
    


