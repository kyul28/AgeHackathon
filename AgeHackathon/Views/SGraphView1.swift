//
//  GraphView.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-12.
//

import SwiftUI

struct SGraphView1: View {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    let steps: [Step]
    
    var totalSteps: Double {
        steps.map { $0.hours }.reduce(0,+)/7
    }
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
                    Capsule().frame(width: 180, height:30)
                        .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                }
                .padding(.bottom)
                Text("60%")
                    .opacity(0.5)
                Spacer()
            }
            .padding(.leading, 25)
            Text("Hours of Sleep:")
                .padding(.bottom)
                .padding(.trailing,250)
            HStack(alignment: .lastTextBaseline) {
                ForEach(steps, id: \.id) { step in
                    let yValue = Swift.min(step.hours*17, 300)
                    VStack {
                        Text("\(step.hours, specifier: "%.1f")")
                            .font(.caption)
                        Rectangle()
                            .fill(step.hours > 7.5 ?
                                    Color.green :Color.red)
                            .frame(width: 20, height: CGFloat(yValue))
                        Text("\(step.date)")
                            .font(.caption)
                    }
                }
            }
            Text("Avg Hours: \(totalSteps, specifier: "%.1f")").padding(.top, 50)
                .opacity(0.5)
                .padding(.bottom, 90)
        }.frame(maxWidth: .infinity, maxHeight: 540)
        .background(Color(#colorLiteral(red: 0.9371757507, green: 0.9372573495, blue: 0.9414530396, alpha: 1)))
        .cornerRadius(10)
        .padding(10)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        let steps = [
            Step(hours: 7.3, date: "S"),
            Step(hours: 6, date: "M"),
            Step(hours: 5.2, date: "T"),
            Step(hours: 10, date: "W"),
            Step(hours: 7.5, date: "Th"),
            Step(hours: 8, date: "F"),
            Step(hours: 8.2, date: "Sa")
        ]
        SGraphView1(steps: steps)
    }
}
