//
//  ViewController.swift
//  GrailDiary
//
//  Created by Chris Dobek on 3/17/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = [POI(location: "Charlotte", country: "USA", clues: ["Queen City"])]
    
    private func updateViews() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                    guard let newPoiVC = segue.destination as? AddPOIViewController else { return }
                
                newPoiVC.delegate = self
            }
        }
    }

    
extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {
            fatalError("Cell is not of POITableViewCell")
        }
            return cell
        }
    }

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }

    
}
