//
//  GraphView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct SGraphView0: View {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    let steps: [Step]
    
//    var totalSteps: Double {
//        steps.map { $0.hours }.reduce(0,+)
//    }
    var body: some View {
        VStack {
            Text("Quality of Sleep:")
                .padding(.bottom)
                .padding(.trailing, 245)
                .padding(.top, 40)
            HStack {
                ZStack (alignment: .leading){
                    Capsule().frame(width: 300, height:30)
                        .foregroundColor(Color(#colorLiteral(red: 0.7105452418, green: 0.9110121727, blue: 0.3273901343, alpha: 1)))
                    Capsule().frame(width: 155, height:30)
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                }
                .padding(.bottom)
                Text("50%")
                    .opacity(0.5)
                Spacer()
            }
            .padding(.leading, 25)
            Text("Hours of Sleep:")
                .padding(.bottom)
                .padding(.trailing,250)
            HStack(alignment: .lastTextBaseline) {
                ForEach(steps, id: \.id) { step in
                    VStack {
                        Text("\(step.hours, specifier: "%.1f")")
                            .font(.caption)
                        if (step.hours == 7.5) {
                            Rectangle()
                                .fill(step.hours == 7.5 ?
                                        Color.green :Color.red)
                                .frame(width: 20, height: 180)
                            Text("\(step.date)")
                                .font(.caption)
                        } else {
                            Rectangle()
                                .fill(step.hours == 7.5 ?
                                        Color.green :Color.red)
                                .frame(width: 20, height: 140)
                            Text("\(step.date)")
                                .font(.caption)
                        }
                    }
                }
            }
            Text("Hours deficient: \(steps[1].hours - steps[0].hours, specifier: "%.1f")").padding(.top, 50)
                .opacity(0.5)
                .padding(.bottom, 80)
        }.frame(maxWidth: .infinity, maxHeight: 540)
        .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SGraphView0_Previews: PreviewProvider {
    static var previews: some View {
        let steps = [
            Step(hours: 6.0, date: "Actual"),
            Step(hours: 7.5, date: "Recommend")
        ]
        SGraphView0(steps: steps)
    }
}
