//
//  Order.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/10/21.
//

import Foundation
import SwiftUI

struct Order : Hashable, Codable, Identifiable{
    var id : Int
    var bookid : Int
    var customerid : Int
    var date : Date
    var quantity : Int
    var total : Int
}
