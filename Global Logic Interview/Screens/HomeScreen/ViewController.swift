//
//  ViewController.swift
//  Global Logic Interview
//
//  Created by Lucas Nahuel Guerra on 27/12/2019.
//  Copyright © 2019 Lucas Nahuel Guerra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var home: UITableView!
    var arrResponse = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        home.register(UINib(nibName: "CustomCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomCell")
        fetchData()
        
        home.delegate = self
        home.dataSource = self
        
        
    }
    
    func fetchData() {
        Alamofire.request("http://private-f0eea-mobilegllatam.apiary-mock.com/list").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)

                if let resData = swiftyJsonVar.arrayObject {
                    self.arrResponse = resData as! [[String:AnyObject]]
                    print(self.arrResponse)
                }
                if self.arrResponse.count > 0 {
                    self.home.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        let dict = arrResponse[indexPath.row]
        
        let url = URL(string: dict["image"] as! String)
        
        cell.title.text = dict["title"] as? String
        cell.homeDescription.text = dict["description"] as? String
        cell.homeImage.layer.masksToBounds = true
        cell.homeImage.kf.setImage(with: url)
        
        
        
        return cell
    }


}

