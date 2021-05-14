//
//  MyHStack.swift
//  Stack_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyHStack : View {
    var body : some View {
        HStack(alignment : .center){
//            Rectangle()
//                .frame(width : 100, height: 100)
//                .foregroundColor(.red)
            
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 70))
            
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.yellow)
            
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.blue)
        } // HStack
        .padding()
        .background(Color.green)
    }
}

struct MyHStackk_Previews: PreviewProvider {
    static var previews: some View {
        MyHStack()
    }
}
