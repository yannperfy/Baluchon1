//
//  Currency.swift
//  Baluchon
//
//  Created by Yann Perfy on 17/06/2022.
//

import Foundation

struct Currency: Codable {
    let success: Bool
    let query: Query
    let info: Info
    let date: String
    let result: Double
}

struct Info: Codable {
    let timestamp: Int
    let rate: Double
}

struct Query: Codable {
    let from, to: String
    let amount: Int
}
