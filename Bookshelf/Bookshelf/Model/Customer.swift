//
//  Customer.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/10/21.
//


import Foundation
import SwiftUI

struct Customer : Hashable, Codable, Identifiable{
    var id : Int
    var name : String
    var email : String
    var address : String
    var number : String
    var password : String
}
