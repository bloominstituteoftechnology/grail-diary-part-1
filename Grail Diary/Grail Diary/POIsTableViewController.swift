//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by macbook on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    var poiArray: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPOIModalSegue" {
            if let addPoiVC = segue.destination as? AddPOIViewController {
                addPoiVC.delegate = self
            }
            
        } 
        
        
//        if segue.identifier == "AddFriendModalSegue" {
//            if let addFriendVC = segue.destination as? AddFriendViewController {
//                addFriendVC.delegate = self
//            }
//        } else if segue.identifier == "ShowFriendDetailSegue" {
//            if let indexPath = tableView.indexPathForSelectedRow,
//                let friendDetailVC = segue.destination as? FriendDetailViewController {
//                friendDetailVC.friend = friends[indexPath.row]
//            }
//
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        poiArray.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    
}


//Wire up the delegate property of the tableview in the storyboard to the view controller
