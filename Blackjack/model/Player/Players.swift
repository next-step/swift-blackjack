//
//  Players.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

struct Players: CustomDebugStringConvertible {
    var players: [Player]
    
    var debugDescription: String {
        String(describing: players)
    }
    
    init(_ players: [Player]) {
        self.players = players
    }
    
    func handoutAllPlayers(deck: Deck) throws {
        try players.forEach { (player) in
            let card = try deck.drawCard()
            player.deal(card)
        }
    }
    
    func askContinue(completion: (Bool, Player) throws -> ()) throws {
        for player in players where player.playing && player.result < Constants.winningNumber {
            let ask: Bool = try InputView.readDrawYesOrNo(name: player.name)
            try completion(ask, player)
        }
    }
}

extension Players {
    func customMap<T>(_ Element: (Player) -> T) -> [T] {
        var result: [T] = []
        
        players.forEach { (player) in
            result.append(Element(player))
        }
        
        return result
    }

    func customFilter(_ completion: ((_ item: Player) -> Bool)) -> [Player] {
        var res: [Player] = []
        
        players.forEach { (player) in
            if completion(player) {
                res.append(player)
            }
        }

        return res
    }
}
