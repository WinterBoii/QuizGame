//
//  Extensions.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-11-28.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
    
    func btnShape() -> some View {
        self.font(.title2)
            .padding()
            .frame(width: 50, height: 50)
    }
    
}
