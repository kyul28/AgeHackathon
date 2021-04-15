//
//  ContentView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-09.
//

import SwiftUI

struct ContentView: View {
    var sleepView: SleepView
    var dietView: DietView
    init() {
        sleepView = SleepView()
        dietView = DietView()
    }
    
    var body: some View {
        TabView {
            ButtonHeaderView(miniCalendar: Date(), state: "diet")
                .tabItem {
                    Image(systemName: "applelogo")
                    Text("Diet")
                }
            
            ButtonHeaderView(miniCalendar: Calendar.current.date(byAdding: DateComponents(month: -1, day: -14), to: Date()) ?? Date(), state: "sleep")
                .tabItem {
                    Image(systemName: "moon.zzz")
                    Text("Sleep")
                }
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
