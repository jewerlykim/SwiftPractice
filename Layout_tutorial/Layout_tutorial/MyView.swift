//
//  MyView.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/23.
//

import SwiftUI

struct MyView : View {
    
    var title : String
    var bgColor : Color
    
    var body: some View{
        ZStack{
            bgColor
//                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
        }// ZStack
        .animation(.none)
    }
}


struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(title: "마이뷰", bgColor: Color.orange)
    }
}
