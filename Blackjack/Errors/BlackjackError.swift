//
//  BlackjackError.swift
//  Blackjack
//
//  Created by Mephrine on 2021/11/14.
//

import Foundation

enum BlackjackError: Error, Equatable {
	enum InputError: Error {
		case empty
		case duplicatedName
		case outOfRangesForNumberOfParticipants
		case outOfRangeInName
		case outOfRangeInYesOrNo
	}
	case bust
	case noCard
	case input(InputError)
}

extension BlackjackError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .input(.empty):
			return "빈 값은 입력이 불가능합니다."
		case .input(.outOfRangeInName):
			return "참여자의 이름은 1~10자리만 가능합니다."
		case .input(.outOfRangesForNumberOfParticipants):
			return "참여자 수는 2~5명만 가능합니다."
		case .input(.duplicatedName):
			return "참여자 이름은 중복이 불가능합니다."
		case .input(.outOfRangeInYesOrNo):
			return "추가 카드 요청은 `y`, `n`만 입력이 가능합니다."
		case .bust:
			return "버스트에서는 카드 추가 요청이 불가능합니다."
		case .noCard:
			return "더 이상 카드가 존재하지 않습니다."
		}
	}
}
