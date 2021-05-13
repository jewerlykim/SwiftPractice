//
//  ContentView.swift
//  SwiftUI_Text_test
//
//  Created by 김보석 on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat : DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일" // 커스텀
//        formatter.dateStyle = .full // Thursday, May 13, 2021
//        formatter.dateStyle = .long // May 13, 2021
        return formatter
    }()
    
    var today = Date() // 오늘의 날짜 가져오는 법
    
    var trueOrFalse : Bool = false
    
    var num : Int = 123

    var body: some View {
        VStack{
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,") // Lorem Ipsum 글자 퍼오는 곳
                .tracking(1) // 글자와 글자 사이의 간격
                .font(.system(.body, design: .monospaced)) // size, type, fontdesign 등 여러가지가 있다.
                .fontWeight(.medium) // 굵게 하겠다
                .multilineTextAlignment(.center) // 글 정렬 기본 Leading
                .lineLimit(nil) // 멀티라인이 됨
                .lineSpacing(10) // 줄 사이 간격
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/) // 글자 잘리는 위치 정하기 head, tail, middle ...으로
                .shadow(color: Color.red, radius: 1.5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10) // 글자 그림자 효과
                .padding() // 기본 패딩 10 vertical 위아래, horizontal 양 옆
                .background(Color.yellow) //배경색
                .cornerRadius(20) // padding 하고 순서 중요함
                .padding()
                .background(Color.green)
            Text("안녕하세요!!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            Text("오늘의 날짜 입니다 : \(today, formatter: ContentView.dateFormat)") // 스위프트에서 문자열 출력하는 방법
            Text("참 혹은 거짓 \(String(trueOrFalse))") // 불린 출력하기
            Text("숫자입니다. : \(num)")
        } // vstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
