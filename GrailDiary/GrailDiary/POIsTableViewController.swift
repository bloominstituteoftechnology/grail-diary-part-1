//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Tobi Kuyoro on 10/12/2019.
//  Copyright © 2019 Tobi Kuyoro. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let destinationVC = segue.destination as? AddPOIViewController {
                destinationVC.delegate = self
            }
        }
    }
}

extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { fatalError() }
        
        
        
        return cell
    }
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
