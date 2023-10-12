//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation



enum CarGoing {
    case directly
    case toRight
    case toLeft
    case stop
}


//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

struct Car {
    private var carBrand: String
    private var carModel: String
    private var horsePower: Int
    private var fuel: String
    private var maxSpeed: Int
    private var year: UInt16
    private var volumeTrunck: UInt16
    private var onOffEngine: Bool
    private var openCloseWindow: Bool
    private var carGoing: CarGoing = .stop
    
    var driving: CarGoing {
        get {
            return carGoing
        }
        set {
            switch newValue {
            case .directly:
                switch carGoing {
                case .directly:
                    ()
                case .toRight:
                    print("Вы выравниваете руль")
                case .toLeft:
                    print("Вы выравниваете руль")
                case .stop:
                    print("Вы двигаетесь с места")
                }
                carGoing = .directly
            case .toRight:
                switch carGoing {
                case .directly:
                    print("Вы поворачиваете направо")
                case .toRight:
                    print("Вы поворочативаете направо")
                case .toLeft:
                    print("Вы поворачиваете направо ")
                case .stop:
                    print("Вы поворачиваете напараво")
                }
                carGoing = .toRight
            case .toLeft:
                switch carGoing {
                case .directly:
                    print("Вы поворачиваете налево")
                case .toRight:
                    print("Вы поворочативаете налево")
                case .toLeft:
                    print("Вы поворачиваете налево")
                case .stop:
                    print("Вы поворачиваете налево")
                }
                carGoing = .toLeft
            case .stop:
                switch carGoing {
                case .directly:
                    print("Вы тормозите")
                case .toRight:
                    print("Вы тормозите")
                case .toLeft:
                    print("Вы тормозите")
                case .stop:
                    ()
                }
                carGoing = .stop
            }
        }
    }
    
    func getMaxSpeed() {
        print("\(carBrand) is max speed equal \(maxSpeed) km/h ")
    }
    
    private var powerkWh : Float {
        return Float(horsePower) * 1.3
    }
    
    func getPowerInkWh(){
        print("\(carBrand) power equal \(powerkWh) kW/h")
    }
    
    init(carBrand: String,carModel: String, horsePower: Int, fuel: String, maxSpeed: Int, year: UInt16, volumeTrunck: UInt16, onOffEngine : Bool, openCloseWindoow : Bool ) {
        self.carBrand = carBrand
        self.horsePower = horsePower
        self.fuel = fuel
        self.maxSpeed = maxSpeed
        self.carModel = carModel
        self.year = year
        self.volumeTrunck = volumeTrunck
        self.onOffEngine = onOffEngine
        self.openCloseWindow = openCloseWindoow
        
    }
}

struct TruckCar {
    
    private var brand: String
    private var model: String
    private var weight: Float
    private var fuel: String
    private var haveTrailer: Bool
    private var liftingCapacity: Int
    private var year: UInt16
    
    func getMaxWeight() -> String {
        guard haveTrailer else { return "You have`t trailer" }
        return "For \(brand) : \(model) max capacity equal \(liftingCapacity)t"
    }
    
    
    init(brand: String, model: String, weight: Float, fuel: String, haveTrailer: Bool, liftingCapacity: Int, year: UInt16) {
        self.brand = brand
        self.model = model
        self.weight = weight
        self.fuel = fuel
        self.haveTrailer = haveTrailer
        self.liftingCapacity = liftingCapacity
        self.year = year
    }
}




    
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

extension Car {
    var isPowerEngine: String {
        get {
            switch onOffEngine {
            case true:
                return "Engine On"
            case false:
                return "Engine Off"
            }
        }
        set {
            switch newValue {
            case "On":
                onOffEngine = true
            case "Off":
                onOffEngine = false
            default:
                ()
            }
        }
    }
}

extension Car {
    var windowStatus: String {
        get {
            switch openCloseWindow{
            case true:
                return "Open"
            case false:
                return "Close"
            }
        }
        set {
            switch newValue {
            case "Open":
                openCloseWindow = true
            case "Close":
                openCloseWindow = false
            default:
                ()
            }
        }
    }
}

extension Car {
    var fullTrunk: String {
        get {
            print("How much things your took?")
            guard let isFull = readLine() else { return "Is empty" }
            var howMuch = String()
            switch isFull {
            case "Many":
                howMuch = "Your trunk filled"
            case "Average":
                howMuch = "Your trunk half empty"
            case "Little":
                howMuch = "Your trunk most of it empty"
            default:
                ()
            }
            return howMuch
        }
    }
}

var bmw = Car(carBrand: "Bmw", carModel: "M5", horsePower: 610, fuel: "Gaz", maxSpeed: 310, year: 2022, volumeTrunck: 400, onOffEngine: true, openCloseWindoow: false )

enum Control {
    case power(Car),window(Car),trunk(Car)
    var control : String {
        switch self {
        case .power(let car):
            var new = car
            print("1.On\n2.Off")
            if let userChoice = readLine(){
                switch userChoice{
                case "1":
                    new.isPowerEngine = "On"
                case "2":
                    new.isPowerEngine = "Off"
                default:
                    ()
                }
            }
            return "\(new.isPowerEngine)"
        case .window(let car):
            var new = car
            print("1.Open\n2.Close")
            if let userChoice = readLine(){
                switch userChoice{
                case "1":
                    new.windowStatus = "Open"
                case "2":
                    new.windowStatus = "Close"
                default:
                    ()
                }
            }
            return "\(new.windowStatus)"
        case .trunk(let car):
            return "\(car.fullTrunk)"
        }
    }
}

print(bmw.driving)
bmw.driving = .directly
bmw.driving = .stop
bmw.driving = .toLeft
bmw.driving = .stop
bmw.driving = .directly
bmw.driving = .toLeft

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.



//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.


//6. Вывести значения свойств экземпляров в консоль.

