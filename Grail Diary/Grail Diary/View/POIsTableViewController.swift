//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit



class POIsTableViewController: UIViewController {
  
    var POIList: [POI] = []

    @IBOutlet weak var TableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
   
    
    // MARK: - Navigation

   
   
    
}
extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return  UITableViewCell() }
        
        let poi = POIList[indexPath.row]
        cell.poi = poi
        
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = TableViewOutlet.indexPathForSelectedRow,
                    let showDetailVC = segue.destination as? POIDetailViewController {
                    showDetailVC.mypoi = POIList[indexPath.row]
                }
            }
        }
    }
 
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIList.append(poi)
        dismiss(animated: true, completion: nil)
        TableViewOutlet.reloadData()
    }
    
   
    }

