//
//  MyVStack.swift
//  Stack_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyVStack : View {
    var body: some View {
        VStack(alignment: .leading, spacing : 10){
//            Rectangle()
//                .frame(height : 1)
            // 정렬, 안에 애들 간격
            Spacer()
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
//            Divider()
//                .opacity(0)
//            // 전부다 alignment를 시킴 희미하게 나눔선 생김
            
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.red)
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.orange)
            Rectangle()
                .frame(width : 100, height: 100)
                .foregroundColor(.blue)
            // 직사각형으로 화면채우기
            Spacer()
            Spacer() // 뷰 sum 같은 느낌
        }// VStack
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(width : 300)
        .background(Color.green)
    }
}


struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
