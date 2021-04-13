//
//  SleepView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct SleepView: View {
    @State private var miniCalendar = Date()
    @State var pickerDateRange = 0
    let steps0 = [
        Step(hours: 6.0, date: "Actual"),
        Step(hours: 7.5, date: "Recommend")
    ]
    let steps1 = [
        Step(hours: 7.3, date: "S"),
        Step(hours: 6, date: "M"),
        Step(hours: 5.2, date: "T"),
        Step(hours: 10, date: "W"),
        Step(hours: 7.5, date: "Th"),
        Step(hours: 8, date: "F"),
        Step(hours: 8.2, date: "Sa")
    ]
    let steps2 = [
        Step(hours: 7.5, date: "2/28~3/06"),
        Step(hours: 6.9, date: "3/07~3/13"),
        Step(hours: 6.2, date: "3/14~3/20"),
        Step(hours: 8.7, date: "3/21~3/27")
    ]
    @State var showDetails = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                HStack {
                    Button(action: {
                        self.showDetails.toggle()
                    }, label: {
                        Text("< Main")
                    })
                    .padding(.leading)
                    Spacer()
                    switch pickerDateRange{
                    case 0:
                        DatePicker("Please select a  date", selection: $miniCalendar,in: ...Date(),
                                   displayedComponents:.date)
                            .labelsHidden()
                    case 1:
                            Text("Feb 28 ~ Mar 6, 2021")
                                .foregroundColor(Color(#colorLiteral(red: 0.04616101086, green: 0.4948464036, blue: 0.9979333282, alpha: 1)))
                                .padding(.all, 7.0)
                                .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
                                .cornerRadius(5)
                    case 2:
                            Text("March 2021")
                                .foregroundColor(Color(#colorLiteral(red: 0.04616101086, green: 0.4948464036, blue: 0.9979333282, alpha: 1)))
                                .padding(.all, 7.0)
                                .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
                                .cornerRadius(5)
                    default:
                        DatePicker("Please select a  date", selection: $miniCalendar,in: ...Date(),
                                   displayedComponents:.date)
                            .labelsHidden()
                    }
                }.padding(.top,150)
                .padding(.trailing)
//                .edgesIgnoringSafeArea(.all)
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
                switch pickerDateRange{
                case 0:
                    SGraphView0(steps: steps0)
                        .padding(.bottom, 250)
                case 1:
                    SGraphView1(steps: steps1)
                        .padding(.bottom, 250)
                case 2:
                    SGraphView2(steps: steps2)
                        .padding(.bottom, 250)
                default:
                    SGraphView1(steps: steps0)
                        .padding(.bottom, 250)
                }
            }
        }
    }
}

struct SleepView_Previews: PreviewProvider {
    static var previews: some View {
        SleepView()
    }
}
