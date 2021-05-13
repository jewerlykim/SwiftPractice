//
//  CircleImageView.swift
//  image_tutorial
//
//  Created by 김보석 on 2021/05/13.
//

import SwiftUI

struct CircleImageView : View {
    var body : some View {
//        Image(systemName: "flame.fill")
//        //sf symbol 다운받기 애플 아이콘임
//            .font(.system(size: 200)) // 사이즈 조절
//            .foregroundColor(.red) // 색
//            .shadow(color: .gray, radius: 2, x: 5, y: 5) //그림자
        Image("myImage") //asset
            .resizable() // 딱맞게
//            .scaledToFit() // aspect 랑 같음
            .scaledToFill() // 꽉채우기
//            .aspectRatio(contentMode: .fill) // fit, fill
            .frame(width: 300, height: 300) // frame 만큼 자른다.
//            .offset(y:-100) // offset 설정
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) // 동그랗게 자르기
            .shadow(color: .gray, radius:10, x: 5, y: 10)
            .overlay(Circle().foregroundColor(.black).opacity(0.4)) // 0<= opacity <= 1 1로 갈수록 불투명
            .overlay(Circle().stroke(Color.red, lineWidth: 10)
                        .padding()
            ) // 덧 씌운다 안에 원을 넣는다.
//            .clipped() // Frame 주변 자르기.
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 다 채우겠다
    }
}


struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
