//
//  ViewController.swift
//  GrailDiary
//
//  Created by Jorge Alvarez on 12/10/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let poiArray: [POI] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 11 Done?
        //tableView.delegate = self
        //tableView.dataSource = self
    }


}

//        10. NOT DONE NEEDS tableviewcell file first
//extension POIsTableViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return poiArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else {fatalError()}
//
//        //let poi = poiArray[indexPath.row]
//        //cell.poi = poi //?
          // return cell //?
//
//    }
//
//}

