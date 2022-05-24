## 블랙잭 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

## 프로그램 요구사항 분석
### 1. player 이름을 입력받는다. - InputView
- player 이름을 `PlayerName` 으로 파싱한다 - `PlayerNameParser`
    - player이름을 콤마를 기준으로 분리한다.
- `PlayerName`들을 가지고 `Player` 인스턴스들을 생성한다.
- 생성한 `Player` 인스턴스를 가지고 `Blackjack` 인스턴스를 생성한다. 

### 2. player에게 카드를 2장씩 나누어준다. - Blackjack.init()
- Card를 2장 뽑는다. - CardDistributor
- 기존의 카드 집합에서 뽑은 카드를 제거한다. - CardDistributor
- player가 카드를 받는다 - Player.receive(card)
- playe는 자신의 카드를 카드 덱(CardDeck)에 보관하라고 메시지를 보낸다. - CardDeck.append(card)
- CardDeck은 전달받은 카드를 보관한다. - CarDeck

### 3. 모든 player가 no를 답할 때까지 반복해서 카드 수령 여부를 묻는다.
- 모든 player에게 카드를 수령할지 묻는다. - Blackjack.start()
    - InputView를 통해 사용자에게 묻는다. - Blackjack이 `answerReader` 에게 사용자의 응답을 읽어오라고 요청한다.
    - 응답데이터 - `Answer`
- 카드 수령이 yes 이면 player에게 카드를 1장배분한다.
- 카드 수령 상태를 출력한다. -  Blackjack이 게임 상태 Delegate (`GameStateDelegate`)에게 상태 출력을 요청한다.
- 모든 사용자의 카드 수령이 끝나면 결과를 반환한다.
