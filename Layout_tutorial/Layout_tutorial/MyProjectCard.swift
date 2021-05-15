//
//  MyProjectCard.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyprojectCard : View {
    
    // 클래스는 struct는 값이 고정이 되어있다 클래스는 참조형이고 스트럭트안에서 값을 설정하고 변경할 수 있게 만들어주는게 State
    @State var shouldShowAlert : Bool = false
    
    
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
                
                Button(action : {
                    print("확인 버튼이 클릭되었다.")
                    self.shouldShowAlert = true
                }){
                    Text("확인")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width : 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented :
                            $shouldShowAlert){
                    Alert(title: Text("알림창입니다!"))
                }
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
