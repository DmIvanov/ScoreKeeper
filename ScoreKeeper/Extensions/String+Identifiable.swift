//
//  String+Identifiable.swift
//  ScoreKeeper
//
//  Created by Ivanov, D. (Dmitrii) on 30/01/2024.
//

import Foundation

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
