//
//  MyBasicCard.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyCard : View {
    
    // 멤버 변수 넣는 자리
    var icon : String
    var title : String
    var start : String
    var end : String
    var bgColor : Color
    
    var body : some View {
        HStack(spacing : 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment : .leading, spacing : 0) {
                Divider().opacity(0)
                Text(title)
                    .font(.system(size: 25))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Spacer().frame(height : 5)
                
                Text("\(start) - \(end)")
                    .foregroundColor(.white)
            }
            
        }// HStack
        .padding(30)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
    }
}
