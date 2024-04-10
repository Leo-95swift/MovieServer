//
//  HotelQuery.swift
//  
//
//  Created by Levon Shaxbazyan on 10.04.24.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String
    let search: String?
}
