//
//  DietView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

//class PickDate: ObservableObject {
//    @Published var type = 0
//}

struct DietView: View {
    @State private var miniCalendar = Date()
    @State var pickerDateRange = 0
//    @StateObject var pickerDateRange = PickDate()
    
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
            }.padding(.top,100)
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
