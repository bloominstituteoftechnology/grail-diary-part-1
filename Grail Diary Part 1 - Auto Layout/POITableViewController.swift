//
//  POITableViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Nicolas Rios on 7/17/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class POITableViewController: UIViewController {

    @IBOutlet weak var POIableViewController: UITableView!
    
    var pois: [POI] = []
    
    extension POITableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        }
            
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "PoiCell", for: indexPath) as? PoiTableViewCell else { return UITableViewCell() }
                
                let poi = pois[indexPath.row]
                cell.poi = poi
                
                return cell
            }

        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "POIModalSegue" {
                if let addPOIVC = segue.destination as? POIViewController {
                    addPOIVC.delegate = self
                }
            } else if segue.identifier == "ShowFriendDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let PoiDetailVC = segue.destination as? POIDetailViewController {
                    PoiDetailVC.friend = poi[indexPath.row]
                }
            }
        }
    }
    
    extension POITableViewController: AddPOIDelegate {
        
        func POIWasCreated(_ poi: POI) {
            POIappend(poi)
            dismiss(animated: true, completion: nil)
            tableView.reloadData()
        }
    }

        
        
        }
    


        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


