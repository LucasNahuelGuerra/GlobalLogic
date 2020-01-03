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
    var arrOfProducts = [[String:AnyObject]]() //Array of dictionary
    
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
                    self.arrOfProducts = resData as! [[String:AnyObject]]
                    print(self.arrOfProducts)
                }
                if self.arrOfProducts.count > 0 {
                    self.home.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        let jsonData = arrOfProducts[indexPath.row]
        
        let url = URL(string: jsonData["image"] as! String)
        
        cell.title.text = jsonData["title"] as? String
        cell.homeDescription.text = jsonData["description"] as? String
        cell.homeImage.layer.masksToBounds = true
        cell.homeImage.contentMode = .scaleToFill
        cell.homeImage.kf.setImage(with: url)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = DetailViewController()
        let jsonData = arrOfProducts[indexPath.row]
        let url = URL(string: jsonData["image"] as! String)
        detail.modalPresentationStyle = .fullScreen
        present(detail, animated: true)
        
        detail.detailTitle.text = jsonData["title"] as? String
        detail.detailDescription.text = jsonData["description"] as? String
        detail.detailDescription.sizeToFit()
        detail.detailImage.kf.setImage(with: url)
        detail.detailImage.contentMode = .scaleToFill
    }


}

