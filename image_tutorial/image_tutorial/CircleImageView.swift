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
            .aspectRatio(contentMode: .fill) // fit, fill
            .frame(width: 200)
            .clipped()
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // 다 채우겠다
    }
}


struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
