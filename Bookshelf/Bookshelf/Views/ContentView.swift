//
//  ContentView.swift
//  Bookshelf
//
//  Created by Rohan Patwardhan on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
       //Homepage()
        NavigationView{

            Login()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
