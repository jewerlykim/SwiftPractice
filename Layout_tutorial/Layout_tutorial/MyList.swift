//
//  MyList.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/15.
//

import SwiftUI

struct MyList : View {
    
    @Binding var isNavigationBarHidden : Bool
    
    init(isNavigationBarHidden : Binding<Bool> = .constant(false)){
        if #available(iOS 14.0, *){
            
        }else{
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
        // 구분선 없애기
        _isNavigationBarHidden = isNavigationBarHidden // binding = 외부
    }
    
    
    
    var body: some View{
//        List{
//            Text("마이 리스트")
//            Text("마이 리스트")
//            Text("마이 리스트")
//            Text("마이 리스트")
//            Text("마이 리스트")
//            Text("마이 리스트")
//        }
//        List{
//            ForEach(1...10, id : \.self){
//                Text("마이 리스트 \($0)")
//            }
//        }
        List{
            
            Section(header: Text("오늘 할 일")){
                ForEach(1...3, id : \.self){itemIndex in
    //                Text("마이 리스트 \(itemIndex)")
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.green)
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)) // 안에 목록들 간격 조절
            .listRowBackground(Color.yellow) // 섹션에 백그라운드 칼라 넣기
            
            Section(header: Text("내일 할 일")){
                ForEach(1...3, id : \.self){itemIndex in
    //                Text("마이 리스트 \(itemIndex)")
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue)
                }
            }
            Section(header: Text("모레 할 일")){
                ForEach(1...3, id : \.self){itemIndex in
    //                Text("마이 리스트 \(itemIndex)")
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.orange)
                }
            }
        }// List
        .listStyle(GroupedListStyle()) // 묶임
//        .listStyle(PlainListStyle()) // 기본
//        .navigationBarTitle("내 목록")
        .onAppear{
            self.isNavigationBarHidden = false
        }
    }
}


struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
