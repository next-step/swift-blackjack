//
//  Blackjack - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    let nameInput = InputView.readPlayerName()
    let names = try PlayerNameParser.parse(nameInput: nameInput)
    
} catch(let error) {
    OutputView.print(error: error)
}

