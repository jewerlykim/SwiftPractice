//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김보석 on 2021/05/07.
//

import SwiftUI

struct MyTextView : View {
    
    @State
    private var index : Int = 0
    
    // 배경색 배열 준비
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        }//Vstack
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("클릭됨")
            if (self.index == self.backgroundColors.count - 1){
                self.index = 0
            } else{
                self.index += 1
            }
        }
    }
}

struct MyTextView_Previews : PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
