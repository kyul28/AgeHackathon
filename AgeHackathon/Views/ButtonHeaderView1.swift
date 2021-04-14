//
//  ButtonHeaderView1.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-13.
//

import SwiftUI

struct ButtonHeaderView1: View {
    @State private var miniCalendar = Date()
    @State var pickerDateRange = SleepView().pickerDateRange
    @State var showDetails = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.showDetails.toggle()
                }, label: {
                    Text("< Main")
                })
                .padding(.leading)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "gearshape")
                })
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
            }.padding(.top)
            .padding(.trailing)
            if (String("\(miniCalendar)").contains("2021-03-01")) {
                SleepView()
            } else {
                NoResultView1()
            }
        }
    }
}

struct ButtonHeaderView1_Previews: PreviewProvider {
    static var previews: some View {
        ButtonHeaderView1()
    }
}
