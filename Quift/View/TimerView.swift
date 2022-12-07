//
//  TimerView.swift
//  Quift
//
//  Created by Muhammad Amiin Obidhonyi on 2022-12-07.
//

import SwiftUI

struct TimerView: View {
    @StateObject var quizManager = QuizManager.shared
    @State var currentDate = Date.now
    @AppStorage("darkmode") var isDark: Bool = false
    let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    @State var countDown = 4
    @State var finishedText: String? = nil
    
    var body: some View {
        VStack {
            if countDown == 0 {
                TriviaView()
            } else {
                Text(finishedText ?? "\(countDown-1)")
                    .font(.system(size: 120, weight: .semibold, design: .rounded))
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .foregroundColor(isDark ? Color("dark_primary") : Color("AccentColor"))
                    .onReceive(timer) { _ in
                        if countDown == 2 {
                            finishedText = "Go!"
                        }
                        countDown -= 1
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .background(isDark ? Color("dark_mode") : quizManager.backgroundColor)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
