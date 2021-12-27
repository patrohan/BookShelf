//
//  GlobalArrayManager.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 12/12/21.
//

import Foundation
class GlobalArrayManager{
    static let shared = GlobalArrayManager()
    var cart : [Int] = []
    var total : Int = 0
    private init(){}
    
    func clearCart(){
        self.cart.removeAll()
        self.total = 0
    }
    
    func addTotal(price: Int){
        self.total = self.total + price
    }

    func getArray()->[Int]{
        return cart
    }
    
    func getTotal()->Int{
        return total
    }

    func addDataInArray(data : Int){
        cart.append(data)
    }
}
