//
//  POIDetailViewController.swift
//  Grail Project Part OneTests
//
//  Created by Eugene White on 6/2/20.
//  Copyright © 2020 Eugene White. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddPOIModalSegue" {
        if let addPOIVC = segue.destination as? AddPOIViewController {
            addPOIVC.delegate = self
        }
        // Do any additional setup after loading the view.
    }
    else if segue.identifier == "showPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = POIs[indexPath.row]
                }
            }
        }
    }

    extension POIsTableViewController: UITableViewDelegate {
    }

    extension POIsTableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return POIs.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell()}
            cell.poi = POIs[indexPath.row]
            return cell
        }
    }

    extension POIsTableViewController: AddPOIDelegate {
        func poiWasAdded(_ poi: POI) {
            POIs.append(poi)
            dismiss(animated: true, completion: nil)
            tableView.reloadData()
        }
    }

}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


