//
//  Diet.swift
//  AgeHackathon
//
//  Created by kyuhee lee on 2021-04-13.
//

import Foundation

struct Diet: Identifiable {
    let id = UUID()
    let actual: Int
    let required: Int
    let type: String
}
