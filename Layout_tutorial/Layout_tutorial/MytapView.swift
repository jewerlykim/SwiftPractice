//
//  MytapView.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/20.
//

import SwiftUI

struct MyTabView : View {
    var body: some View{
        TabView{
            // 보여질 화면
            Text("1번")
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            Text("2번")
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            Text("3번")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
