//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Lambda_School_Loaner_254 on 1/23/20.
//  Copyright © 2020 Rebecca Roshon. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

     var pointsOfInterst: [POI] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension POIsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsOfInterst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POIsTableViewController else {return UITableViewCell()}
        
        let pointOfInterest = pointsOfInterst[indexPath.row]
        
        cell.
    }
    
    
        
    
}
