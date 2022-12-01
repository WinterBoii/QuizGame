//
//  QuizButtonView.swift
//  Quift
//
//  Created by Filmon Mehari Gebrezghi on 2022-11-19.
//

import SwiftUI

struct QuizButtonView: View {
    let title: String
    var body: some View {
        Button{
        }label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.green)
        }
        .foregroundColor(.black)
    }
}

struct QuizButtonView_Previews: PreviewProvider {
    static var previews: some View {
        QuizButtonView(title: "Bread")
    }
}
