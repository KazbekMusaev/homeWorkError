//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation


protocol PeopleProtocol {
    var name: String { get }
    var age : Int { get set }
    var _hp: Int { get set }
}
protocol DefenceProtocol {
    func defence()
}
protocol FighterProtocol : PeopleProtocol, AttackProtocol, DefenceProtocol {
    var typeFighter: Fighters { get }
    var _strength: Int { get set }
    func isDead() -> Bool
}
protocol AttackProtocol {
    func attack(fighter : FighterProtocol)
}

enum Fighters: CustomStringConvertible {
    case warrior
    case mag
    var description: String {
        switch self {
        case .warrior:
            return "Воин"
        case .mag:
            return "Маг"
        }
    }
}



final class Weapon {
    var weaponName : String
    weak var owner : Fighter?
    init(weaponName: String){
        self.weaponName = weaponName
    }
}

class Fighter: FighterProtocol {
    
    
    var _hp: Int = 0
    let name : String
    var age: Int
    let typeFighter : Fighters
    var _strength = Int()
    var weapon : Weapon?
    
    private var hp : Int {
            get { return _hp }
            set { _hp = max(0, newValue) }
    }
    
    var strength: Int {
        get { return _strength }
        set { _strength = max(0, newValue) }
    }
    
    func attack(fighter : FighterProtocol) {
        hp -= fighter._strength
        print("\(typeFighter) был атакован и получил урон \(_strength)")
    }
    
    func isDead() -> Bool {
        if hp == 0 {
            return true
        } else { return false }
    }
    
    init(name : String, typeFighters: Fighters, weapon : Weapon?, age: Int){
        self.age = age
        self.name = name
        self.typeFighter = typeFighters
        self.weapon = weapon
    }
    
    deinit {
        print("Класс уничтожен")
    }
    
    func defence() {
        //
    }
    
}

final class Warrior : Fighter {
    override var strength: Int {
        get {
            return _strength + 20
        }
        set {
            _strength = max(0, newValue)
        }
    }
    func shieldBash() {
        
    }
}

final class Mag : Fighter {
    override var strength: Int {
        get {
            return _strength + 10
        }
        set {
            _strength = max(0, newValue)
        }
    }
    func castSpell() {
        
    }
}


func startGame (userFigthter: inout FighterProtocol, otherFighter: inout FighterProtocol) {
    
    var defaultWeapon = Weapon(weaponName: "Have`t")
    
    print("Начало игры")
    print("Выберите бойца")
    print("1.Маг\n2.Воин")
    
    guard let fighterChoice = readLine() else { return }
    print("Выберите имя вашего бойца")
    guard let nameFighter = readLine() else { return }
    print("Выберите возраст бойца")
    guard let ageFighter = readLine() else { return }
    guard let ageFighter = Int(ageFighter) else { return }
    switch fighterChoice {
    case "1":
        otherFighter = Warrior(name: "Konan Warwar", typeFighters: .warrior, weapon: defaultWeapon, age: 100)
        print("Выберите оружие")
        print("1.Магический посох\n2.Травмат (+20 к силе)")
        if let weaponChoice = readLine(){
            switch weaponChoice {
            case "1":
                defaultWeapon = Weapon(weaponName: "Магический посох")
                userFigthter = Mag(name: nameFighter, typeFighters: .mag, weapon: defaultWeapon, age: ageFighter)
            case "2":
                defaultWeapon = Weapon(weaponName: "Травмат")
                userFigthter = Mag(name: nameFighter, typeFighters: .mag, weapon: defaultWeapon, age: ageFighter)
                userFigthter._strength += 20
                otherFighter._strength += 10
            default: ()
            }
        }
    case "2":
        otherFighter = Mag(name: "John Wick", typeFighters: .mag, weapon: defaultWeapon, age: 100)
        print("Выберите оружие")
        print("1.Меч\n2.Травмат(+20 к силе)")
        if let weaponChoice = readLine() {
            switch weaponChoice {
            case "1":
                defaultWeapon = Weapon(weaponName: "Меч")
                userFigthter = Warrior(name: nameFighter, typeFighters: .warrior, weapon: defaultWeapon, age: ageFighter)
            case "2":
                defaultWeapon = Weapon(weaponName: "Травмат")
                userFigthter = Warrior(name: nameFighter, typeFighters: .warrior, weapon: defaultWeapon, age: ageFighter)
                userFigthter._strength += 20
                otherFighter._strength += 10
            default: ()
            }
        }
    default: ()
    }
    
    print("Выберите начальное количество здоровья")
    guard let defaultHp = readLine() else { return }
    guard let defaultHp = Int(defaultHp) else { return }
    userFigthter._hp = defaultHp
    otherFighter._hp = defaultHp
    
    print("Подготовка выполнена")
    print("Битва началась\n")
    
    while  !userFigthter.isDead() && !otherFighter.isDead() {
        if userFigthter.isDead() {
            print("Вы проиграли")
            break
        } else if otherFighter.isDead() {
            print("Вы выиграли")
            break
        }
        
        print("\n\(userFigthter.name) -> \(userFigthter.typeFighter) -> \(userFigthter._hp)")
        print("\(otherFighter.name) -> \(otherFighter.typeFighter) -> \(otherFighter._hp)\n")
        
        otherFighter.attack(fighter: userFigthter)
        userFigthter.attack(fighter: otherFighter)
    }
}


var myFighter: FighterProtocol = Fighter(name: "Konan", typeFighters: .warrior, weapon: nil, age: 20)
var enemyFighter: FighterProtocol = Fighter(name: "John", typeFighters: .mag, weapon: nil, age: 20)

startGame(userFigthter: &myFighter, otherFighter: &enemyFighter)
