//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김보석 on 2021/05/06.
//
import SwiftUI


struct MyVstackView : View{
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated : Bool
    
    // 생성자
    init(isActivated : Binding<Bool> =
            .constant(false)) {
        _isActivated = isActivated
    }
    
    var body : some View {
        VStack{
            Text("1!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("2!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("3!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            Text("4!")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
        } // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
