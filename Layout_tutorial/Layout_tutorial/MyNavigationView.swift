//
//  MyNavigationView.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/16.
//

import SwiftUI

struct MynavigationView : View{
    var body: some View{
        NavigationView{
//            Text("네비게이션 뷰")
                 //large or inline
            MyList()
            
            .navigationBarTitle("안녕하세요", displayMode: .inline)
                .navigationBarItems(leading: Button(action : {
                    print("호호")
                }){
                    Text("하하")
                }, trailing:
                    NavigationLink(destination : Text("넘어온 화면")){
//                        Text("네비게이션")
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.green)
                    }
                
                )
        }// navigationView
    }
}


struct MynavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MynavigationView()
    }
}
