//
//  CartShelf.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/11/21.
//

import Foundation

import SwiftUI

struct CartShelf : Hashable, Codable, Identifiable{
    var id : Int
    var name : String
    var author : String
    var price : Int
    var description : String
    var category : String
    //var categoryid : Int
    
    var imageName : String
    var image : Image{
        Image(imageName)
    }
    var pdflink : String
    var language : String
    var rating : String
}
