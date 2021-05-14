//
//  ContentView.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment : .bottomTrailing){ // 오른쪽 아래
            VStack(alignment : .leading, spacing : 0) {
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }.padding(20)
                
                
                Text("주얼리킴 할 일 목록")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .padding(.horizontal, 20)
                
                ScrollView{
                    VStack {
                        MyprojectCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()

                    }.padding()
                }
                
            }
            
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 60, height: 60, alignment: .center)
                .overlay(
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                )
                .padding(10)
                .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
