//
//  DGraphView1.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct DGraphView1: View {
    let diets: [Diet]
//
//    var totalSteps: Int {
//        diets.map { $0.actual }.reduce(0,+)/7
//    }
    var body: some View {
        VStack {
            HStack {
                Text("Average Nutrients consumed:")
                    .padding(.bottom)
                    .padding(.leading, 10)
                Spacer()
                Text("""
                    red/blue: actual
                    green: required
                    """)
                    .font(.system(size: 12))
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    .opacity(0.5)
            }.padding(.bottom, 30)
            HStack(alignment: .lastTextBaseline) {
                ForEach(diets, id: \.id) { diet in
                    VStack {
                        HStack (alignment: .bottom){
                            if (diet.type == "Calories(kcal)") {
                                VStack {
                                    Text("\(diet.actual)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.actual > 1500 ?
                                                Color.blue :Color.red)
                                        .frame(width: 20, height: 170)
                                }
                                VStack {
                                    Text("\(diet.required)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.required == 1500 ?
                                                Color.green : Color.white)
                                        .frame(width: 20, height: 200)
                                }
                            } else if (diet.type == "Fluid(mL)") {
                                VStack {
                                    Text("\(diet.actual)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.actual > 1650 ?
                                                Color.blue :Color.red)
                                        .frame(width: 20, height: 120)
                                }
                                VStack {
                                    Text("\(diet.required)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.required == 1650 ?
                                                Color.green : Color.white)
                                        .frame(width: 20, height: 200)
                                }
                            } else if (diet.type == "Protein(g)") {
                                VStack {
                                    Text("  \(diet.actual)  ")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.actual > 66 ?
                                                Color.blue :Color.red)
                                        .frame(width: 20, height: 178)
                                }
                                VStack {
                                    Text("  \(diet.required)  ")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.required == 66 ?
                                                Color.green : Color.white)
                                        .frame(width: 20, height: 200)
                                }
                            } else {
                                VStack {
                                    Text("\(diet.actual)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.actual > 1200 ?
                                                Color.blue :Color.red)
                                        .frame(width: 20, height: 190)
                                }
                                VStack {
                                    Text("\(diet.required)")
                                        .font(.caption)
                                    Rectangle()
                                        .fill(diet.required == 1200 ?
                                                Color.green : Color.white)
                                        .frame(width: 20, height: 200)
                                }
                            }
                        }
                        Text("\(diet.type)")
                            .font(.caption)
                    }.padding(.horizontal, 5)
                }
            }
            HStack {
                Text("Details: ")
                    .padding(.top, 40)
                    .padding(.leading, 10)
                Spacer()
            }
            Text("""
                Calories Intake: -200kCal/day
                Fluid Intake: -450mL/day
                Protein: -14g/day
                Calcium: -40mg/day
                """)
                .font(.system(size: 15))
                .padding(.top, 0.1)
                .padding(.trailing, 100)
                .opacity(0.7)
            
        }.frame(minWidth: 400, minHeight: 500)
        .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
        .cornerRadius(10)
        .padding(10)
    }
}

struct DGraphView1_Previews: PreviewProvider {
    static var previews: some View {
        let diets = [
            Diet(actual: 1300, required: 1500, type: "Calories(kcal)"),
            Diet(actual: 1200, required: 1650, type: "Fluid(mL)"),
            Diet(actual: 52, required: 66, type: "Protein(g)"),
            Diet(actual: 1160, required: 1200, type: "Calcium(mg)")
        ]
        DGraphView1(diets: diets)
    }
}
