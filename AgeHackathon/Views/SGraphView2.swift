//
//  GraphView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct SGraphView2: View {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    let steps: [Step]
    
    var totalSteps: Double {
        steps.map { $0.hours }.reduce(0,+)/4
    }
    var body: some View {
        VStack {
            Text("Average Quality of Sleep:")
                .padding(.bottom)
                .padding(.trailing, 180)
                .padding(.top, 40)
            HStack {
                ZStack (alignment: .leading){
                    Capsule().frame(width: 300, height:30)
                        .foregroundColor(Color(#colorLiteral(red: 0.7105452418, green: 0.9110121727, blue: 0.3273901343, alpha: 1)))
                    Capsule().frame(width: 165, height:30)
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                }
                .padding(.bottom)
                Text("54.6%")
                    .opacity(0.5)
                Spacer()
            }
            .padding(.leading, 25)
            Text("Average Hours of Sleep:")
                .padding(.bottom)
                .padding(.trailing,185)
            HStack(alignment: .lastTextBaseline) {
                ForEach(steps, id: \.id) { step in
                    let yValue = Swift.min(step.hours*20, 300)
                    VStack {
                        Text("\(step.hours, specifier: "%.1f")")
                            .font(.caption)
                        if (step.hours == 8.7) {
                            Rectangle()
                                .fill(step.hours > 7.5 ?
                                        Color.green :Color.red)
                                .frame(width: 20, height: 180)
                            Text("\(step.date)")
                                .font(.caption)
                        } else {
                            Rectangle()
                                .fill(step.hours > 7.5 ?
                                        Color.green :Color.red)
                                .frame(width: 20, height: CGFloat(yValue))
                            Text("\(step.date)")
                                .font(.caption)
                        }
                    }
                }
            }
            Text("Avg Hours: \(totalSteps, specifier: "%.1f")").padding(.top, 50)
                .opacity(0.5)
                .padding(.bottom, 80)
        }.frame(maxWidth: .infinity, maxHeight: 540)
        .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SGraphView2_Previews: PreviewProvider {
    static var previews: some View {
        let steps = [
            Step(hours: 7.5, date: "2/28~3/06"),
            Step(hours: 6.9, date: "3/07~3/13"),
            Step(hours: 6.2, date: "3/14~3/20"),
            Step(hours: 8.7, date: "3/21~3/27")
        ]
        SGraphView2(steps: steps)
    }
}
