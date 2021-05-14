//
//  MyZStack.swift
//  Stack_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyZStack : View {
    var body : some View {
        ZStack{ // 위에서부터 아래로 쌓임
            Rectangle()
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.red)
                .zIndex(0)
                
            
            
            Rectangle()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.yellow)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            Image(systemName: "flame.fill")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .zIndex(2)
        }
    }
}


struct MyZStack_Previews: PreviewProvider {
    static var previews: some View {
        MyZStack()
    }
}
