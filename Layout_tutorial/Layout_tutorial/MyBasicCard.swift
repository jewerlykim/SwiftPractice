//
//  MyBasicCard.swift
//  Layout_tutorial
//
//  Created by 김보석 on 2021/05/14.
//

import SwiftUI

struct MyBasicCard : View {
    var body : some View {
        HStack(spacing : 20) {
            Image(systemName: "flag.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment : .leading, spacing : 0) {
                Divider().opacity(0)
                Text("하하하")
                    .font(.system(size: 25))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Spacer().frame(height : 5)
                
                Text("하하하")
                    .foregroundColor(.white)
            }
            
        }// HStack
        .padding(30)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
