//
//  ContentView.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden : Bool = false
    
    var body: some View {
        NavigationView{
            ZStack(alignment : .bottomTrailing){ // 오른쪽 아래
                VStack(alignment : .leading, spacing : 0) {
                    HStack{
                        NavigationLink(destination : MyList(isNavigationBarHidden: self.$isNavigationBarHidden)){
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        
                        
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
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
                            MyCard(icon: "tv.fill", title: "영상 다시보기", start: "8 AM", end: "9 AM", bgColor: Color.red)
                            MyCard(icon: "cart.fill", title: "마트 장보기", start: "10 AM", end: "11 AM", bgColor: Color.orange)
                            MyCard(icon: "gamecontroller.fill", title: "롤 하기", start: "3 PM", end: "4 PM", bgColor: Color.green)

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
            } // ZStack
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear{
                self.isNavigationBarHidden = true
            }
        }// Navigation View
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
