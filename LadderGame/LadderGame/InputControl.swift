import Foundation

struct InputControl {
    
    //MARK: 비공개 정적 메소드
    private static func ask(for question: String) throws -> String {
        print(question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        return input
    }
    
    //MARK: 정적 메소드
    static func readNameOfPlayers() throws -> [Player] {
        let nameOfPlayers = try InputControl.ask(for: "참여할 사람 이름을 입력하세요. (이름은 쉼표`,`로 구분)")
        let players = try nameOfPlayers.split(separator: ",").map { try Player(name: String($0)) }
        guard players.count > 1 else {
            throw InputError.invalidNumberOfPlayers
        }
        return players
    }
    
    static func readHeight() throws -> Int {
        guard let height = Int(try InputControl.ask(for: "사다리의 높이를 입력하세요.")) else {
            throw InputError.cannotClassifyNumber
        }
        guard height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return height
    }
    
    
}
