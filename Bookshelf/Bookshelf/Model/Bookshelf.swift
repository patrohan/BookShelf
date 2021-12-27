//
//  Bookshelf.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import Foundation
import SwiftUI

struct Bookshelf : Hashable, Codable, Identifiable{
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
    var incart : Int
    
    init() {
        self.id = 100
        self.name = "abc"
        self.author = "abc"
        self.price = 10
        self.description = "abc"
        self.category = "abc"
        self.imageName = "abc"
        self.pdflink = "pdf"
        self.language = "English"
        self.rating = "5"
        self.incart = 0
    }
}
