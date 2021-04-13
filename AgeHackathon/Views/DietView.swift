//
//  DietView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct DietView: View {
    @State private var miniCalendar = Date()
    @State var pickerDateRange = 0
    let diets0 = [
        Diet(actual: 1350, required: 1500, type: "Calories(kcal)"),
        Diet(actual: 1000, required: 1650, type: "Fluid(mL)"),
        Diet(actual: 59, required: 66, type: "Protein(g)"),
        Diet(actual: 1270, required: 1200, type: "Calcium(mg)")
    ]
    let diets1 = [
        Diet(actual: 1300, required: 1500, type: "Calories(kcal)"),
        Diet(actual: 1200, required: 1650, type: "Fluid(mL)"),
        Diet(actual: 52, required: 66, type: "Protein(g)"),
        Diet(actual: 1160, required: 1200, type: "Calcium(mg)")
    ]
    let diets2 = [
        Diet(actual: 1410, required: 1500, type: "Calories(kcal)"),
        Diet(actual: 1360, required: 1650, type: "Fluid(mL)"),
        Diet(actual: 56, required: 66, type: "Protein(g)"),
        Diet(actual: 1005, required: 1200, type: "Calcium(mg)")
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
                Spacer()
                Text("Diet & Nutrition")
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
                    DGraphView0(diets: diets0)
                        .padding(.bottom, 250)
                case 1:
                    DGraphView1(diets: diets1)
                        .padding(.bottom, 250)
                case 2:
                    DGraphView2(diets: diets2)
                        .padding(.bottom, 250)
                default:
                    DGraphView0(diets: diets0)
                        .padding(.bottom, 250)
                }
            }
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
