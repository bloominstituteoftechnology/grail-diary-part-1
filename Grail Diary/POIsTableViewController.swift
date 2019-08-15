//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by William Chen on 8/14/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var pois: [POI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        tableView.dataSource = self
        
        
=======

>>>>>>> edda7f8c4e5e80b5ef2c829fd4d7aa9df2288061
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue"{
            if let addPOIVC = segue.destination as? AddPOIViewController{
                addPOIVC.delegate = self
<<<<<<< HEAD
            }
        }else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let poiDetailVC = segue.destination as? POIDetailViewController{
                poiDetailVC.poi = pois[indexPath.row]
                
            }
=======
            }else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController{
                    poiDetailVC.poi = pois[indexPath.row]
                    
                }
>>>>>>> edda7f8c4e5e80b5ef2c829fd4d7aa9df2288061
        }
        
    }
    
<<<<<<< HEAD
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
=======
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

>>>>>>> edda7f8c4e5e80b5ef2c829fd4d7aa9df2288061
}

extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POI Cell", for: indexPath) as? POITableViewCell else {return UITableViewCell()}
<<<<<<< HEAD
        
        let poi = pois[indexPath.row]
        cell.poi = poi
        return cell
    }
    
    
}
=======
    
        let poi = pois[indexPath.row]
       
         return cell
    }
    
    
    }
>>>>>>> edda7f8c4e5e80b5ef2c829fd4d7aa9df2288061

extension POIsTableViewController: AddPOIDelegate{
    func poiWasCreated (_ poi: POI ){
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
    }
    
    
}
