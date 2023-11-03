//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

print("Figther Club")


protocol People {
    var name: String { get }
    var healt: Int { get set }
}

protocol FighterProtocol: People {
    var strenght: Int { get set }
    var agility: Int { get set }
    var armor: Int { get set }
    var energy: Int { get set }
    var dodge: Int { get set }
}

class Fighter: FighterProtocol {
    var strenght = 10
    var agility = 6
    var armor = 2
    var energy = 100
    var name: String
    var healt = 100
    var dodge = 10
    
    init(name: String){
        self.name = name
    }
    
    func isDead() -> Bool {
        guard healt > 0 else { return true }
        return false
    }
    func noEnergy() -> Bool {
        guard energy > 0 else { return true }
        return false
    }
    
    func getStats() {
        print("""
                Боец - \(name)
                Ваши статы :
                Сила = \(strenght)
                Ловкость = \(agility)
                Броня = \(armor)
                Энергия = \(energy)
                Жизни = \(healt)
                Уклонение = \(dodge)
                """)
    }
    
    func getInitialStats() {
        getStats()
        print("Вначале игры каждому бойцу предоставляется возможность распеделить 15 очков умений")
        print("""
                1 очко силы дает 2 урона, и 5 жизней
                1 очко ловкости дает 2 к броне, и 3% уклонения
                """)
        print("Распределите очки умений")
        print("Выберите Силу")
        if let strenghtChoice = readLine() {
            if let strenghtChoice = Int(strenghtChoice) {
                if strenghtChoice > 15 {
                    print("Вы добавили слишком много силы. Добавляется 15 очков")
                    strenght += strenghtChoice
                } else if strenghtChoice < 15 && strenghtChoice > 0 {
                    strenght += strenghtChoice
                    agility += 15 - strenghtChoice
                    print("Добалено \(strenghtChoice) очков силы, и \(15 - strenghtChoice) ловкости")
                }
            }
        }
    }
    func invertStats() {
        healt += strenght * 5
        armor += agility * 2
        dodge += agility * 3
    }
    func isDodge() -> Bool {
        let randomValue = Int.random(in: 0..<100)
        let dodgeArrayOne = [Int] (repeating: 1, count: dodge)
        let dodgeArrayTwo = [Int] (repeating: 0, count: 100-dodge)
        let resultArray = dodgeArrayOne + dodgeArrayTwo
        guard resultArray[randomValue] == 1 else { return false }
        return true
    }
    func attack(fighters: Fighter) {
        guard !isDead() else { print("Мертвый не может атаковать") ; return }
        guard !isDodge() else { print("Промах") ; return }
        guard !fighters.noEnergy() else { print("Не хватает энергии") ; fighters.energy += 5; return }
        fighters.energy -= 10
        let damage = (fighters.strenght * 2) - armor
        self.healt -= damage
        print("\(name) нанес урон \(damage)")
        fighters.energy += 5
    }
}

func startGame() {
    print("Выберите имя вашего бойца")
    guard let userFighterName = readLine() else { return }
    let userFighter = Fighter(name: userFighterName)
    let enemyFighter = Fighter(name: "Нархозовский Бычара")
    userFighter.getInitialStats()
    userFighter.invertStats()
    enemyFighter.strenght += 7
    enemyFighter.agility += 8
    enemyFighter.invertStats()
    var round = 0
    while !userFighter.isDead() && !enemyFighter.isDead()  {
        if round == 12 { break }
        print("ROUND \(round) !!!")
        print("\(userFighter.name) -> \(userFighter.healt) жизни")
        print("\(enemyFighter.name) -> \(enemyFighter.healt) жизни")
        print("Для атаки нажмите Enter")
        if readLine() != nil {
            enemyFighter.attack(fighters: userFighter)
            userFighter.attack(fighters: enemyFighter)
        }
        round += 1
    }
    guard userFighter.isDead() else { print("Ваш боец проиграл"); return}
    guard enemyFighter.isDead() else { print("Вы выиграли"); return}
    if round == 12 {
        if userFighter.energy > enemyFighter.energy {
            print("Вы выиграли")
        } else if userFighter.energy == enemyFighter.energy {
            print("Ничья")
        } else {
            print("Вы проиграли")
        }
    }
    print(userFighter.energy)
    print(enemyFighter.energy)
}


startGame()
