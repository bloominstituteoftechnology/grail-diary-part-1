//
//  ViewController.swift
//  Grail Diary
//
//  Created by Jessie Ann Griffin on 7/25/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class CluesTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pointOfInterestCell", for: indexPath)
        
        return cell
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        if segue.identifier == "ShowPOIDetailSegue" {
//            guard let poiDetailVC = segue.destination as? CluesDetailViewController,
//                let indexPath = tableView.indexPathForSelectedRow else { return }
////
////            let details = vocabController.vocabWords[indexPath.row]
////            definitionVC.vocabWord = definition
//        }
//
//        if segue.identifier == "AddPOIModalSegue" {
//            guard let addNewPOIVC = segue.destination as? AddPOIViewController else { return }
//
////            let details = vocabController.vocabWords[indexPath.row]
////            definitionVC.vocabWord = definition
//        }
//    }
}

