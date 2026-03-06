//
//  ReuseablePostCards.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import SwiftUI

struct ReuseablePostCards: View {
    let id: Int
    let title: String
    let des: String
    init(id: Int, title: String, des: String) {
        self.id = id
        self.title = title
        self.des = des
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.clear)
              
               
    
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(des)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding(.leading,12)
            
        } .padding(.all,8)
    }
}

#Preview {
    ReuseablePostCards(id: 1, title: "I am kundan", des: "I am ios developer")
}
