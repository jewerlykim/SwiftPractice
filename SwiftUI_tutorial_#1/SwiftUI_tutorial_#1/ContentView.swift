//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김보석 on 2021/05/06.
//

import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    MyVstackView()
                    MyVstackView()
                    MyVstackView()
                }
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? Color.yellow : Color.black)
                // add tap gesture
                .onTapGesture {
                    // 애니메이션과 함께
                    withAnimation{
                        // toggle() true 면 false, false 면 true로
                        self.isActivated.toggle()
                    }
                } // HStack
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView()){
                    Text("네비게이션")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top, 50)
            } // VStack
            
        } // NavigationView
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
