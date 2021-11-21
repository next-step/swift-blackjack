//
//  BlackjackViewController.swift
//  Blackjack
//
//  Created by 남기범 on 2021/11/20.
//

import Foundation

struct BlackjackInputView {
    enum InputError: Error {
        case notInputYorN
    }
    
    func inputGammerName() -> String {
        print("게임에 참여할 사람의 이름을 입력하세요.(쉼표 기준으로 분리)")
        return readLine() ?? ""
    }

    func inputIsPick(name: String) throws -> Bool {
        print("\(name)는 한장의 카드를 더 받겠습니까?(예는 y, 아니오는 n)")
        guard let input = readLine() else { throw InputError.notInputYorN }
        
        switch input {
        case "y": return true
        case "n": return false
        default: throw InputError.notInputYorN
        }
    }
}

struct BlackjackOutputView {
    func printCards(in gammer: CardGammer, isPrintResult: Bool = false) {
        let names = gammer.cards
            .map { $0.cardName }
            .joined(separator: ", ")
        
        guard isPrintResult else {
            print("\(gammer.name)카드: \(names)")
            return
        }

        print("\(gammer.name)카드: \(names) - 결과: \(gammer.cardSum)")
    }
    
    func printDistributedTwoCards(_ gammerNames: [String]) {
        let names = gammerNames.joined(separator: ", ")
        print("\(names)에게 2장씩 나누었습니다.")
    }
}

class BlackjackViewController {
    private let inputView = BlackjackInputView()
    private let outputView = BlackjackOutputView()
    
    private var gammers = [CardGammer]()
    private var cardDack = [
        Card(number: 2, type: .clover),
        Card(number: 3, type: .diamond),
        Card(number: 4, type: .spade),
        Card(number: 5, type: .hart),
        Card(number: 6, type: .clover),
        Card(number: 7, type: .diamond),
        Card(number: 8, type: .spade),
        Card(number: 9, type: .hart),
        Card(number: nil, type: .king),
        Card(number: nil, type: .queen),
        Card(number: nil, type: .jack),
        Card(number: nil, type: .ace)
    ]
    
    func startGame() {
        suffleDack()
        let namesString = inputView.inputGammerName()
        let gammers = factoryGammers(namesString: namesString, separator: ",")
        
        prepareMeterials(gammers: gammers)
        progressCardGame(gammers: gammers)
    }
}


private extension BlackjackViewController {
    func prepareMeterials(gammers: [CardGammer]) {
        gammers.forEach { gammer in
            distributeCard(gammer: gammer, count: 2)
        }
        
        outputView.printDistributedTwoCards(gammers.map { $0.name })
        gammers.forEach { gammer in
            outputView.printCards(in: gammer)
        }
    }
    
    func progressCardGame(gammers: [CardGammer]) {
        gammers.forEach { gammer in
            do {
                while try inputView.inputIsPick(name: gammer.name) {
                    distributeCard(gammer: gammer)
                    outputView.printCards(in: gammer)
                }
            } catch {
                print(error)
            }
        }
        
        gammers.forEach { gammer in
            outputView.printCards(in: gammer, isPrintResult: true)
        }
    }
    
    func factoryGammers(namesString: String, separator: String) -> [CardGammer] {
        let names = namesString.components(separatedBy: separator)
        return names.map { CardGammer(name: $0) }
    }
    
    func suffleDack() {
        var suffledDack = [Card]()
        
        while !cardDack.isEmpty {
            guard let randomNumber = (0..<cardDack.count).randomElement()
            else { return }
            
            let card = cardDack.remove(at: randomNumber)
            suffledDack.append(card)
        }
        
        cardDack = suffledDack
    }
    
    func distributeCard(gammer: CardGammer, count: Int = 1) {
        for _ in 0..<count {
            let card = cardDack.removeLast()
            gammer.pickCard(card)
        }
    }
}
