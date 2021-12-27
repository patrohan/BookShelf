//
//  ModelData.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import Foundation

var bookshelfs: [Bookshelf] = load("landmarkData.json")
var categories : [CategoryShelf] = load("categoriesData.json")
var cart : [CartShelf] = load("cartData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
