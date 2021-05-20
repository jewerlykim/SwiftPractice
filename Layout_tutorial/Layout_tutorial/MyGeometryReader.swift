//
//  MyGeometryReader.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/20.
//

import SwiftUI

enum Index {
    case one, two, three
}



struct MyGeometryReader : View {
    
    @State var index : Index = .one
    
    
    var body: some View {
        GeometryReader { geometryReader in // 변수명
            HStack(spacing : 10) {
                Button(action : {
                    print("1번이 클릭되었습니다.")
                    withAnimation{
                        self.index = .one
                    }
                }){
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width : geometryReader.size.width / 3)
                        .padding(.horizontal, self.index == .one ? 50 : 0)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                }
                
                Text("2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width : geometryReader.size.width / 3)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width : geometryReader.size.width / 3)
                    .foregroundColor(Color.white)
                    .background(Color.green)
//                Text("4")
//                    .font(.largeTitle)
//                    .fontWeight(.black)
//                    .frame(width : 50)
//                    .foregroundColor(Color.white)
//                    .background(Color.purple)
            }// HStack 디바이스 화면마다 보이는 모양이 다름
            .background(Color.yellow)
            
        }// Geometry reader
        .background(Color.black)
        
        
        
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
