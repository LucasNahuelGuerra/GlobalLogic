//
//  Product.swift
//  Global Logic Interview
//
//  Created by Lucas Nahuel Guerra on 27/12/2019.
//  Copyright © 2019 Lucas Nahuel Guerra. All rights reserved.
//

import Foundation

struct Product: Codable {
    let title: String
    let description: String
    let thumbnails: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case thumbnails
    }
}
