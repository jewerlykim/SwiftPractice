//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김보석 on 2021/05/06.
//
import SwiftUI


struct MyVstackView : View{
    var body : some View {
        VStack{
            Text("1!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("2!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("3!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("4!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
        } // HStack
        .background(Color.blue)
    }
}

struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
