//
//  ViewController.swift
//  GrailDiary
//
//  Created by Nichole Davidson on 1/21/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    @IBOutlet weak var listOfPOIs: UITableView!
    
    var delegate: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            // We know we are going to the AddFriendViewController
           
            //Gives access to AddFriendViewController
           guard let addPOIVC = segue.destination as?
            AddPOIViewController else { return }
            
            addPOIVC.delegate = self
        }
    }
        
    }


var poiArray: [POI] = [POI(location: <#T##String#>, country: <#T##String#>, clues: <#T##[String]#>)]

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    }

}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        
        poiArray.append(poi)
        
        tableView.reloadData()
    }

}
