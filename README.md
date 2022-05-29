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

## 2단계 요구사항 분석

### 4. 딜러도 player로 참여한다. 
- 딜러도 player와 동일하게 '게임 참여자' 역할이므로, Player를 상속받는 Dealer를 만든다.
or Player를 프로토콜로 빼고 Dealer가 Player 프로토콜을 채택한다.

### 5. 딜러는 처음에 받은 2장의 합계가 16이하이면 반드시 1장의 카드를 추가로 받아야 하고, 17점 이상이면 추가로 받을 수 없습니다.
- 딜러가 현재 카드를 받을지 AnswerReadDelegate에게 물어본다  
- 딜러가 현재 보유한 카드 점수를 계산한다 - Dealer
- 딜러가 현재 보유한 카드 점수가 16이하인지 체크한다. - AnswerReadDelegate
- 16이하라면 카드를 받는다고 한다. - AnswerReadDelegate에서 yes를 반환한다. (아니면 no를 반환한다.)

### 6. 게임을 완료한 후 각 플레이어별로 승패를 출력합니다.
- BlackjackGame.start()의 결과물 = [BlackjackScore]
- [BlackjackScore]를 가지고 승패를 계산하라고 심판(GameJudge)에게 요청한다. 결과물: WinLoseResult
    - GameJudge는 프로토콜
    - BlackjackGameJudge은 GameJudge를 채택한다.
-  WinLose를 가지고 WinLoseFormatter에게 출력물(String)로 변환해달라고 요청한다.
- 출력물을 OutputView에게 출력해달라고 요청한다.
 
 
