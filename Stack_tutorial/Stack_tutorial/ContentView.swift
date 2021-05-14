//
//  ContentView.swift
//  Stack_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.red)
        } // HStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
