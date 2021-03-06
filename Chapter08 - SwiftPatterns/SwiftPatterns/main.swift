//
//  main.swift
//  SwiftPatterns
//
//  Created by Florent Vilmart on 2018-07-31.
//  Copyright © 2018 flovilmart. All rights reserved.
//

import Foundation
import AppKit

print("Hello, World!")

protocol BasicProtocol {}
protocol ComplexProtocol: BasicProtocol {}

class MySuperClass {}
protocol AnotherProtocol {}

class MyClass: MySuperClass, BasicProtocol, AnotherProtocol {}
struct MyStruct: AnotherProtocol {}

protocol DemoProtocol {
    var aRequiredProperty: String { get set }
    var aReadonlyProperty: Double { get }
    static var aStaticProperty: Int { get set }
    init(requiredProperty: String)
    func doSomething() -> Bool
}

protocol Incrementing {
    mutating func increment() -> Int
}

struct Counter: Incrementing {
    private var value: Int = 0

    mutating func increment() -> Int {
        value += 1
        return value
    }
}

protocol RunnerDelegate: class {
    func didStart(runner: Runner)
    func didStop(runner: Runner)
}

class Runner {
    weak var delegate: RunnerDelegate?


    func start() {
        // Start the runner
        delegate?.didStart(runner: self)
    }

    func stop() {
        delegate?.didStop(runner: self)
    }
}

let runner = Runner()
runner.start()
runner.stop()

typealias HashAndEquatable = Hashable & Equatable & RunnerDelegate

typealias RunnerDelegateView = NSView & RunnerDelegate

