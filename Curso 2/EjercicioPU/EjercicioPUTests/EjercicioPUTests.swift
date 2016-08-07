//
//  EjercicioPUTests.swift
//  EjercicioPUTests
//
//  Created by Edson Mojica on 06/08/16.
//  Copyright © 2016 Edson Mojica. All rights reserved.
//

import XCTest
@testable import EjercicioPU

class EjercicioPUTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testPesoBajo(){
        let mc:ModeloIMC=ModeloIMC()
        mc.peso=50
        mc.estatura=1.7
        XCTAssertEqual(mc.IMC(), 17.30, "Correcto Bajo de Peso")
    }
    func testPesoNormal(){
        let mc:ModeloIMC=ModeloIMC()
        mc.peso=60
        mc.estatura=1.7
        XCTAssertEqual(mc.IMC(), 20.76, "Correcto Peso Normal")
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
