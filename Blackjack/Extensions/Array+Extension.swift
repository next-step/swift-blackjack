//
//  Array+Extension.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/16.
//

import Foundation

extension Array {
	subscript(safe index: Int) -> Element? {
		indices ~= index ? self[index] : nil
	}
}
