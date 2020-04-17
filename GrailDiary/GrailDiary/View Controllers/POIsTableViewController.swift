//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Sammy Alvarado on 4/9/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    var propertys: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddPOIModalSegue" {
//            if let addVC = segue.description as? AddPOIViewController {
//                addVC.
//            }
//        }
//    }
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ()
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        propertys.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}

