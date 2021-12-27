//
//  OrderShelf.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/10/21.
//

import Foundation
import SwiftUI

struct OrderShelf : Hashable, Codable, Identifiable{
    var id : Int
    var bookid : Int
    var customerid : Int
    var date : Date
    var quantity : Int
    var total : Int
}

