//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
// https://excalidraw.com/#room=c7ec1a63909294c5022a,7Ey8QDwdQZcEs0kw37gm2g
// Механика боя

import Foundation

// Создание файтера
// Будет 3 персонажа на выбор
// Ловкач - Разбойник(robber)
// Силач - Воин(warrior)
// Интеллектуал - Маг(mag)


class Fighter {
    
    // MARK: Хранимые свойства
    private var _level: UInt8 = 0 // Уровень
    private var _hp: Int = 0// Жизни
    private var _agility: Int = 0 // Ловкость
    private var _strength: Int = 0 // Сила
    private var _mind: Int = 0 // Интеллект
    private var _armor: Int = 0 // Броня
    private var _damage: Int = 0 // Урон
    private var _criticalDamage: Int = 0 // Критический урон
    private var _chanceCriticalDamage: Int = 0 // Шанс критического удара
    private var _chanceIgnoreArmore: Int = 0 // Шанс игнорировать броню
    private var _chanceDodge: Int = 0 // Уклонение
    private var _regeneration: Float = 0 // Регенирация
    private var _precisionDamage: Int = 0 // Точность атаки (игнорировать уклонение)
    
    private var _damageByStrength: Int = 0 // Прилось создать отдельно, для подсчета урона, при помощи силы
    private var _hpByStrenght: Int = 0 // Тоже временная перменная, для подсчета жизней, за счет очков силы
    private var _chanceCritbyMind: Int = 0 // Промежуточная перменная для увелечения шанса крита, за счет ума
    private var _chanceIgnoreArmorByMind: Int = 0 // Промежут перменная для игнора брони
    private var _criticalDamageByMind: Int = 0 // Промежут переменная для критического урона, за счет ума
    private var _regenerationByStrength: Float = 0
    private var _armorByAgility: Int = 0
    private var _chanceDodgeByAgility: Int = 0
    private var _precisionDamageByAgility: Int = 0
    
    // MARK: Свойства вычисляемые
    var agility: Int {
        get { return _agility }
        set {
            _agility = max(0, min(30, newValue))
            switch agility {
            case 1: _armorByAgility = 3 ; _chanceDodgeByAgility = 2 ; _precisionDamageByAgility = 2
            case 2: _armorByAgility = 6 ; _chanceDodgeByAgility = 4 ; _precisionDamageByAgility = 4
            case 3: _armorByAgility = 9 ; _chanceDodgeByAgility = 6 ; _precisionDamageByAgility = 6
            case 4: _armorByAgility = 12 ; _chanceDodgeByAgility = 8 ; _precisionDamageByAgility = 8
            case 5: _armorByAgility = 15 ; _chanceDodgeByAgility = 10 ; _precisionDamageByAgility = 10
            case 6: _armorByAgility = 20 ; _chanceDodgeByAgility = Int(12.5) ; _precisionDamageByAgility = 12
            case 7: _armorByAgility = 25 ; _chanceDodgeByAgility = 15 ; _precisionDamageByAgility = 14
            case 8: _armorByAgility = 30 ; _chanceDodgeByAgility = Int(17.5) ; _precisionDamageByAgility = 16
            case 9: _armorByAgility = 35 ; _chanceDodgeByAgility = 20 ; _precisionDamageByAgility = 18
            case 10: _armorByAgility = 40 ; _chanceDodgeByAgility = 23 ; _precisionDamageByAgility = 20
            case 11: _armorByAgility = 47 ; _chanceDodgeByAgility = 26 ; _precisionDamageByAgility = 22
            case 12: _armorByAgility = 54 ; _chanceDodgeByAgility = 29 ; _precisionDamageByAgility = 24
            case 13: _armorByAgility = 61 ; _chanceDodgeByAgility = 32 ; _precisionDamageByAgility = 26
            case 14: _armorByAgility = 68 ; _chanceDodgeByAgility = 35 ; _precisionDamageByAgility = 28
            case 15: _armorByAgility = 75 ; _chanceDodgeByAgility = 38 ; _precisionDamageByAgility = 30
            case 16: _armorByAgility = 84 ; _chanceDodgeByAgility = Int(41.5) ; _precisionDamageByAgility = 32
            case 17: _armorByAgility = 93 ; _chanceDodgeByAgility = 46 ; _precisionDamageByAgility = 34
            case 18: _armorByAgility = 102 ; _chanceDodgeByAgility = Int(49.5) ; _precisionDamageByAgility = 36
            case 19: _armorByAgility = 111 ; _chanceDodgeByAgility = 53 ; _precisionDamageByAgility = 38
            case 20: _armorByAgility = 120 ; _chanceDodgeByAgility = 57 ; _precisionDamageByAgility = 40
            case 21: _armorByAgility = 131 ; _chanceDodgeByAgility = 61 ; _precisionDamageByAgility = 42
            case 22: _armorByAgility = 142 ; _chanceDodgeByAgility = 65 ; _precisionDamageByAgility = 44
            case 23: _armorByAgility = 153 ; _chanceDodgeByAgility = 69 ; _precisionDamageByAgility = 46
            case 24: _armorByAgility = 164 ; _chanceDodgeByAgility = 73 ; _precisionDamageByAgility = 48
            case 25: _armorByAgility = 175 ; _chanceDodgeByAgility = 77 ; _precisionDamageByAgility = 50
            case 26: _armorByAgility = 188 ; _chanceDodgeByAgility = Int(81.5) ; _precisionDamageByAgility = 52
            case 27: _armorByAgility = 201 ; _chanceDodgeByAgility = 86 ; _precisionDamageByAgility = 54
            case 28: _armorByAgility = 214 ; _chanceDodgeByAgility = Int(90.5) ; _precisionDamageByAgility = 56
            case 29: _armorByAgility = 227 ; _chanceDodgeByAgility = 95 ; _precisionDamageByAgility = 58
            case 30: _armorByAgility = 240 ; _chanceDodgeByAgility = 100 ; _precisionDamageByAgility = 60
            default: ()
            }
        }
    }
    var strength: Int {
        get { return _strength }
        set {
            _strength = max(0, min(30, newValue))
            switch strength {
            case 1: _damageByStrength = 3 ; _hpByStrenght = 20
            case 2: _damageByStrength = 6 ; _hpByStrenght = 40
            case 3: _damageByStrength = 9 ; _hpByStrenght = 60
            case 4: _damageByStrength = 12 ; _hpByStrenght = 80
            case 5: _damageByStrength = 15 ; _hpByStrenght = 100 ; _regenerationByStrength = 5.0
            case 6: _damageByStrength = 21 ; _hpByStrenght = 130
            case 7: _damageByStrength = 27 ; _hpByStrenght = 160
            case 8: _damageByStrength = 33 ; _hpByStrenght = 190
            case 9: _damageByStrength = 39 ; _hpByStrenght = 220
            case 10: _damageByStrength = 45 ; _hpByStrenght = 250 ; _regenerationByStrength = 10.0
            case 11: _damageByStrength = 54 ; _hpByStrenght = 290
            case 12: _damageByStrength = 63 ; _hpByStrenght = 330
            case 13: _damageByStrength = 72 ; _hpByStrenght = 370
            case 14: _damageByStrength = 81 ; _hpByStrenght = 410
            case 15: _damageByStrength = 90 ; _hpByStrenght = 450 ; _regenerationByStrength = 15.0
            case 16: _damageByStrength = 102 ; _hpByStrenght = 500
            case 17: _damageByStrength = 114 ; _hpByStrenght = 550
            case 18: _damageByStrength = 126 ; _hpByStrenght = 600
            case 19: _damageByStrength = 138 ; _hpByStrenght = 650
            case 20: _damageByStrength = 150 ; _hpByStrenght = 700 ; _regenerationByStrength = 20.0
            case 21: _damageByStrength = 165 ; _hpByStrenght = 760
            case 22: _damageByStrength = 180 ; _hpByStrenght = 820
            case 23: _damageByStrength = 195 ; _hpByStrenght = 880
            case 24: _damageByStrength = 210 ; _hpByStrenght = 940
            case 25: _damageByStrength = 225 ; _hpByStrenght = 1000 ; _regenerationByStrength = 25.0
            case 26: _damageByStrength = 243 ; _hpByStrenght = 1070
            case 27: _damageByStrength = 261 ; _hpByStrenght = 1140
            case 28: _damageByStrength = 279 ; _hpByStrenght = 1210
            case 29: _damageByStrength = 297 ; _hpByStrenght = 1280
            case 30: _damageByStrength = 315 ; _hpByStrenght = 1350 ; _regenerationByStrength = 50.0
            default: ()
            }
        }
    }
    var mind: Int {
        get { return _mind }
        set {
            _mind = max(0, min(30, newValue))
            switch mind {
            case 1: _chanceCritbyMind = 2 ; _chanceIgnoreArmore = 1
            case 2: _chanceCritbyMind = 4 ; _chanceIgnoreArmore = 2
            case 3: _chanceCritbyMind = 6 ; _chanceIgnoreArmore = 3
            case 4: _chanceCritbyMind = 8 ; _chanceIgnoreArmore = 4
            case 5: _chanceCritbyMind = 10 ; _chanceIgnoreArmore = 5
            case 6: _chanceCritbyMind = 12 ; _chanceIgnoreArmore = 6 ; _criticalDamageByMind = 25
            case 7: _chanceCritbyMind = 14 ; _chanceIgnoreArmore = 7
            case 8: _chanceCritbyMind = 16 ; _chanceIgnoreArmore = 8
            case 9: _chanceCritbyMind = 18 ; _chanceIgnoreArmore = 9
            case 10: _chanceCritbyMind = 20 ; _chanceIgnoreArmore = 10
            case 11: _chanceCritbyMind = 22 ; _chanceIgnoreArmore = 11 ; _criticalDamageByMind = 50
            case 12: _chanceCritbyMind = 24 ; _chanceIgnoreArmore = 12
            case 13: _chanceCritbyMind = 26 ; _chanceIgnoreArmore = 13
            case 14: _chanceCritbyMind = 28 ; _chanceIgnoreArmore = 14
            case 15: _chanceCritbyMind = 30 ; _chanceIgnoreArmore = 15
            case 16: _chanceCritbyMind = 32 ; _chanceIgnoreArmore = 16 ; _criticalDamageByMind = 75
            case 17: _chanceCritbyMind = 34 ; _chanceIgnoreArmore = 17
            case 18: _chanceCritbyMind = 36 ; _chanceIgnoreArmore = 18
            case 19: _chanceCritbyMind = 38 ; _chanceIgnoreArmore = 19
            case 20: _chanceCritbyMind = 40 ; _chanceIgnoreArmore = 20
            case 21: _chanceCritbyMind = 42 ; _chanceIgnoreArmore = 21 ; _criticalDamageByMind = 100
            case 22: _chanceCritbyMind = 44 ; _chanceIgnoreArmore = 22
            case 23: _chanceCritbyMind = 46 ; _chanceIgnoreArmore = 23
            case 24: _chanceCritbyMind = 48 ; _chanceIgnoreArmore = 24
            case 25: _chanceCritbyMind = 50 ; _chanceIgnoreArmore = 25
            case 26: _chanceCritbyMind = 52 ; _chanceIgnoreArmore = 26 ; _criticalDamageByMind = 150
            case 27: _chanceCritbyMind = 54 ; _chanceIgnoreArmore = 27
            case 28: _chanceCritbyMind = 56 ; _chanceIgnoreArmore = 28
            case 29: _chanceCritbyMind = 58 ; _chanceIgnoreArmore = 29
            case 30: _chanceCritbyMind = 60 ; _chanceIgnoreArmore = 30 ; _criticalDamageByMind = 300
            default: ()
            }
            
        }
    }
    
  
    var hp: Int {
        get { return _hp + _hpByStrenght }
        set { _hp += (newValue - (_hp + _hpByStrenght)) }
    }
    var damage: Int {
        get { return _damage + _damageByStrength }
        set { _damage = max(0, newValue) }
    }
    var armor: Int {
        get { return _armor + _armorByAgility }
        set { _armor = max(0, newValue) }
    }
    var chanceCriticalDamage: Int {
        get { return _chanceCriticalDamage + _chanceCritbyMind }
        set { _chanceCriticalDamage = max(0, min(100, newValue)) }
    }
    var chanceIgnoreArmore: Int {
        get { return _chanceIgnoreArmore + _chanceIgnoreArmorByMind }
        set { _chanceIgnoreArmore = max(0, min(100, newValue)) }
    }
    var precisionDamage: Int {
        get { return _precisionDamage + _precisionDamageByAgility }
        set { _precisionDamage = max (0, min(100, newValue)) }
    }
    var chanceDodge: Int {
        get { return _chanceDodge + _chanceDodgeByAgility }
        set { _chanceDodge = max(0 , min(100, newValue)) }
    }
    var criticalDamage: Int {
        get { return _criticalDamage + _criticalDamageByMind }
        set { _criticalDamage = max(0, newValue) }
    }
    var regeneration: Float {
        get { return _regeneration + _regenerationByStrength }
        set { _regeneration = max(0, newValue) }
    }
    var level: UInt8 {
        get { return _level }
        set {
            _level = max(0, min (40, newValue))
            print("""
                    Вы можете добавить следующие очки умений
                    1. Strength
                    2. Agility
                    3. Mind
                    """)
            if let levelUp = readLine() {
                switch levelUp {
                case "1":
                    if strength == 30 {
                        print("У вас максимальное количество силы, выберите другой навык")
                        print("1. Agility")
                        print("2. Mind")
                        if let levelUpOther = readLine() {
                            switch levelUpOther {
                            case "1":
                                agility += 1
                            case "2":
                                mind += 1
                            default : ()
                            }
                        }
                    } else { strength += 1 }
                case "2":
                    if agility == 30 {
                        print("У вас максимальное количество ловкости, выберите другой навый")
                        print("1. Strength")
                        print("2. Mind")
                        if let levelUpOther = readLine() {
                            switch levelUpOther {
                            case "1":
                                strength += 1
                            case "2":
                                mind += 1
                            default: ()
                            }
                        }
                    } else { agility += 1 }
                case "3":
                    if mind == 30 {
                        print("У вас максимальное количество ума, выберите другой навык")
                        print("1. Strength")
                        print("2. Agility")
                        if let levelUpOther = readLine() {
                            switch levelUpOther {
                            case "1":
                                strength += 1
                            case "2":
                                agility += 1
                            default: ()
                            }
                        }
                    } else { mind += 1 }
                default: ()
                }
            }
        }
    }
    
    
    
    // MARK: Начальные статы
    func getInitialStats(){
        if self is Robber {
            damage = 10
            hp = 100
            armor = 4
            chanceCriticalDamage = 5
            precisionDamage = 10
            chanceDodge = 15
            criticalDamage = 150
            agility = 7
            strength = 2
            mind = 3
        } else if self is Warrior {
            damage = 20
            hp = 170
            armor = 1
            chanceCriticalDamage = 2
            precisionDamage = 5
            chanceDodge = 5
            criticalDamage = 150
            agility = 1
            strength = 5
            mind = 3
            regeneration = 4.0
        } else if self is Mag {
            damage = 30
            hp = 120
            armor = 2
            chanceCriticalDamage = 15
            chanceIgnoreArmore = 10
            precisionDamage = 5
            chanceDodge = 5
            criticalDamage = 250
            agility = 2
            strength = 4
            mind = 7
        }
    }
    
    // MARK: Механика вероятности
    func ignoreArmoreProbability() -> Bool {
        var isIgnore = false
        if chanceIgnoreArmore != 0 {
            let probabilityOne = Array(repeating: 1, count: chanceIgnoreArmore)
            let probabilityTwo = Array(repeating: 0, count: 100-chanceIgnoreArmore)
            let realIgnoreArray = probabilityOne + probabilityTwo
            let random = Int.random(in: 0..<100)
            if realIgnoreArray[random] == 1 {
                isIgnore = true
            }
        }
        return isIgnore
    }
    
    
    func dodgeProbability() -> Bool {
        let dodge = chanceDodge - precisionDamage
        var isDodge = false
        if dodge != 0 {
            let probabilityDodgeOne = Array(repeating: 1, count: dodge)
            let probabilityDodgeTwo = Array(repeating: 0, count: 100-dodge)
            let realDodgeArray = probabilityDodgeOne + probabilityDodgeTwo
            let random = Int.random(in: 0..<100)
            if realDodgeArray[random] == 1 {
                isDodge = true
            }
        }
        return isDodge
    }
    
    func critProbability(chance: Int) -> Bool {
        var isCrit = false
        if chance != 0 {
            let probabilityOne = Array(repeating: 1, count: chance)
            let probabilityTwo = Array(repeating: 0, count: 100-chance)
            let realCritArray = probabilityOne + probabilityTwo
            let random = Int.random(in: 0..<100)
            if realCritArray[random] == 1 {
                isCrit = true
            }
        }
        return isCrit
    }
    
    // MARK: Смерть
    
    func isDead() -> Bool {
        if hp <= 0 { return false }
        else { return true }
    }
    
    // MARK: Механика атаки
    
    func attack(damageOtherPerson: Int, criticalDamageOtherPerson: Int ) {
        guard isDead() else { print("Dead"); return}
        guard !dodgeProbability() else { print("Miss"); return}
        if critProbability(chance: self._chanceCriticalDamage) {
            print("Critical damage")
            let critPlusDamage = (damageOtherPerson * criticalDamageOtherPerson) / 100
            hp -= critPlusDamage
        } else {
            hp -= damageOtherPerson
        }
    }
    
}


final class Warrior: Fighter {
    
}

final class Robber: Fighter {
    
}

final class Mag: Fighter {
    
    
}



func startsFight(first: Fighter, second: Fighter){
    first.getInitialStats()
    second.getInitialStats()
    if first is Warrior {
        if second is Robber {
            while first.isDead() || second.isDead() {
                print("Воин : HP \(first.hp)Damage \(first.damage) Level\(first.level)")
                print("Разбойник : HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Воин")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Разбойник")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Воина повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Разбойника повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Разбойник победил")
                }
                if second.hp == 0 {
                    print("Воин победил")
                }
            }
        } else if second is Mag {
            while first.isDead() || second.isDead() {
                print("Воин : HP \(first.hp) Damage \(first.damage) Level\(first.level)")
                print("Маг : HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Воин")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Разбойник")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Воина повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Мага повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Маг победил")
                    print("Игра закончилась")
                    break
                }
                if second.hp == 0 {
                    print("Воин победил")
                    print("Игра закончилась")
                    break
                }
            }
        }
    } else if first is Robber {
        if second is Warrior {
            while first.isDead() || second.isDead() {
                print("Разюойник : HP \(first.hp) Damage \(first.damage) Level\(first.level)")
                print("Воин : HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Разбойник")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Воин")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Разбойника повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Воина повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Воин победил")
                    print("Игра закончилась")
                    break
                }
                if second.hp == 0 {
                    print("Разбойник победил")
                    print("Игра закончилась")
                    break
                }
            }
        } else if second is Mag {
            while first.isDead() || second.isDead() {
                print("Разбойник :  HP \(first.hp) Damage \(first.damage) Level\(first.level)")
                print("Маг :  HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Разбойник")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Маг")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Разбойника повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Мага повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Маг победил")
                    print("Игра закончилась")
                    break
                }
                if second.hp == 0 {
                    print("Разбойник победил")
                    print("Игра закончилась")
                    break
                }
            }
        }
    } else if first is Mag {
        if second is Warrior {
            while first.isDead() || second.isDead() {
                print("Маг : HP \(first.hp) Damage \(first.damage) Level\(first.level)")
                print("Воин : HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Маг")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Воин")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Мага повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Воина повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Воин победил")
                    print("Игра закончилась")
                    break
                }
                if second.hp == 0 {
                    print("Маг победил")
                    print("Игра закончилась")
                    break
                }
            }
        } else if second is Robber {
            while first.isDead() || second.isDead() {
                print("Маг :  HP \(first.hp) Damage \(first.damage) Level\(first.level)")
                print("Разбойник : HP \(second.hp) Damage \(second.damage) Level\(second.level)")
                print("Атакует Маг")
                first.attack(damageOtherPerson: first.damage, criticalDamageOtherPerson: first.chanceCriticalDamage)
                print("Атакует Разбойник")
                second.attack(damageOtherPerson: second.damage, criticalDamageOtherPerson: second.chanceCriticalDamage)
                if first.level < 40 {
                    print("У Мага повысился уровень")
                    first.level += 1
                }
                if second.level < 40 {
                    print("У Разбойника повысился уровень")
                    second.level += 1
                }
                if first.hp == 0 {
                    print("Разбойник победил")
                    print("Игра закончилась")
                    break
                }
                if second.hp == 0 {
                    print("Маг победил")
                    print("Игра закончилась")
                    break
                }
            }
        }
    }
}

var war = Warrior()
var rob = Robber()
var mag = Mag()

func startGame () {
    print("""
           Добро пожаловать в битву 🗡️
           """)
    var exitCheck = 0
    while exitCheck == 0 {
        print("""
                1. Выбор бойца
                2. Информация о бойцах
                3. Механика игры
                4. Выйти
              """)
        guard let choice = readLine() else { print("Вы покинули игру за ожидание"); return }
        switch choice {
        case "1":
            print("Выберите бойца")
            print("1. Воин")
            print("2. Разбойник")
            print("3. Маг")
            if let choiceFirstFighter = readLine() {
                switch choiceFirstFighter {
                case "1":
                    print("Выбрите соперника")
                    print("1. Разбойник")
                    print("2. Маг")
                    if let choiceSecondFighter = readLine() {
                        switch choiceSecondFighter {
                        case "1" :
                            startsFight(first: war, second: rob)
                        case "2":
                            startsFight(first: war, second: mag)
                        default : ()
                        }
                    }
                case "2":
                    print("Выбрите соперника")
                    print("1. Воин")
                    print("2. Маг")
                    if let choiceSecondFighter = readLine() {
                        switch choiceSecondFighter {
                        case "1" :
                            startsFight(first: rob, second: war)
                        case "2":
                            startsFight(first: rob, second: mag)
                        default : ()
                        }
                    }
                case "3":
                    print("Выбрите соперника")
                    print("1. Воин")
                    print("2. Разбойник")
                    if let choiceSecondFighter = readLine() {
                        switch choiceSecondFighter {
                        case "1" :
                            startsFight(first: mag, second: war)
                        case "2":
                            startsFight(first: mag, second: rob)
                        default : ()
                        }
                    }
                default: ()
                }
            }
        case "2":
            print("""
               Воин - имеет увеличенное здоровье и урон
               Разбойник - имеет много брони и уклонения
               Маг - имеет высокий уровень критического урона и также возможность контр.атаки
               """)
        case "3":
            print("""
                В игре вы выбераете своего бойца
                Также противник выберает своего бойца
                И вы начинаете игру со своими персонажами
                После каждого удара, увеличесвается уровень
                Игра продолжится, пока один игрок не потеряет все свое здоровье
                """)
        default:
            print("Вы покинули игру не начав ее 🤐")
            exitCheck = 1
        }
    }
}



startGame()
