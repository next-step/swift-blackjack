//
//  String + Extension.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

extension String {
    var isNotEmpty: Bool { return !self.isEmpty }
    var isNotBlank: Bool { return self != " " }
}
