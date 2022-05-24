//
//  UserGuider.swift
//  Blackjack
//
//  Created by 강수진 on 2022/05/22.
//

import Foundation

protocol UserInformable {
    var guideDescription: String { get }
}

struct UserGuider {
    func printGuide(for information: UserInformable) {
        print(information.guideDescription)
    }
}
