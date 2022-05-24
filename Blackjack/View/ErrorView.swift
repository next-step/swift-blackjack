//
//  ErrorView.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

struct ErrorView {
    func printError(for error: Error) {
        print(error.localizedDescription)
    }
}
