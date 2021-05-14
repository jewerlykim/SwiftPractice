//
//  MyProjectCard.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyprojectCard : View {
    var body: some View {
        VStack(alignment : .leading, spacing : 0) {
            Rectangle().frame(height : 0)
            Text("주얼리킴 스위프트 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10 AM ~ 11 AM")
                .foregroundColor(.secondary) // 회색
                .padding(.bottom, 10) // or spacer
            HStack{
                Image("user1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                    Circle()
                        .stroke(lineWidth: 5)
                        .foregroundColor(.red)
                    )
                Image("user2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("user3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                Text("확인")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width : 80)
                    .background(Color.blue)
                    .cornerRadius(20)
                    
            } // HStack
        }// VStack
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyprojectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyprojectCard()
    }
}
