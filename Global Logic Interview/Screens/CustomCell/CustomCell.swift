//
//  CustomCell.swift
//  Global Logic Interview
//
//  Created by Lucas Nahuel Guerra on 27/12/2019.
//  Copyright © 2019 Lucas Nahuel Guerra. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var homeDescription: UILabel!
    @IBOutlet var homeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
