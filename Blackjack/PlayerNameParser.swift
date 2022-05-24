//
//  PlayerNameParser.swift
//  Blackjack
//
//  Created by nylah.j on 2022/05/24.
//

import Foundation

enum PlayerNameParser {
    enum Error: LocalizedError {
        case invalid
        
        var errorDescription: String? {
            switch self {
            case .invalid: return "이름은 콤마로 구분되어 하나이상 입력되어야 합니다."
            }
        }
    }
    
    private static let delimiter = ","
    
    static func parse(nameInput: String?) throws -> [PlayerName] {
        guard let names = nameInput?.components(separatedBy: delimiter)
                                    .filter({ $0.isNotEmpty && $0.isNotBlank }),
              names.isNotEmpty else {
                  throw Error.invalid
              }

        print("names: \(names)")
        return names.compactMap { PlayerName($0) }
    }
}
