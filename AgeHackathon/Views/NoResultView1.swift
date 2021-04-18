//
//  NoResultView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

//class PickDate: ObservableObject {
//    @Published var type = 0
//}

struct NoResultView1: View {
    @State private var miniCalendar = Date()
    @State var pickerDateRange = 0
//    @StateObject var pickerDateRange = PickDate()
    @State var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                Text("Sleep")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                Picker(selection: $pickerDateRange, label: Text("")) {
                    Text("Daily").tag(0)
                    Text("Weekly").tag(1)
                    Text("Monthly").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                Text("No Data Provided")
                    .frame(minWidth: 400, minHeight: 500)
                    .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
                    .cornerRadius(10)
                    .padding(10)
                    .opacity(0.5)
            }.padding(.top,100)
            .padding(.bottom, 250)
        }
    }
}

struct NoResultView1_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView1()
    }
}
