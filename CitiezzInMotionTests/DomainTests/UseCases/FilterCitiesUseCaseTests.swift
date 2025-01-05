//
//  FilterCitiesUseCaseTests.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//
import XCTest
@testable import CitiezzInMotion

final class FilterCitiesUseCaseTests: XCTestCase {
  private var useCase: FilterCitiesUseCase!
  private let latamCities = latamDTOs.map { CityMapper.mapToDomain(from: $0) }
  private let generalCities = generalDTOs.map { CityMapper.mapToDomain(from: $0) }
  
  override func setUp() {
    super.setUp()
    useCase = FilterCitiesUseCase()
  }
  
  override func tearDown() {
    useCase = nil
    super.tearDown()
  }
  
  func testFilterCitiesWithValidFilter() {
    let filter = "Col"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 2)
  }
  
  func testFilterCitiesWithLowerCaseAndUpperCase() {
    let filter = "cAr"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "Caracas, Venezuela")
  }
  
  func testFilterCitiesWithSpecialCharacters() {
    let filter = "São"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "São Paulo, Brasil")
  }
  
  func testFilterCitiesWithDiacritics() {
    let filter = "perú"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "Lima, Perú")
  }
  
  func testFilterCitiesWithoutDiacritics() {
    let filter = "bogota"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "Bogotá, Colombia")
  }
  
  func testFilterCitiesWithNoMatch() {
    let filter = "London"
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertTrue(result.isEmpty)
  }
  
  func testFilterCitiesWithEmptyFilter() {
    let filter = ""
    let result = useCase.execute(cities: latamCities, filter: filter)
    
    XCTAssertEqual(result.count, 11)
  }
  
  func testFilterCitiesWithSingleCharacterA() {
    let filter = "A"
    let result = useCase.execute(cities: generalCities, filter: filter)
    
    XCTAssertEqual(result.count, 5)
  }
  
  func testFilterCitiesWithSingleCharacterU() {
    let filter = "u"
    let result = useCase.execute(cities: generalCities, filter: filter)
    
    XCTAssertEqual(result.count, 4)
  }
  
  func testFilterCitiesWithSingleCharacterS() {
    let filter = "s"
    let result = useCase.execute(cities: generalCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "Sydney, AU")
  }
  
  func testFilterCitiesWithPrefixAl() {
    let filter = "Al"
    let result = useCase.execute(cities: generalCities, filter: filter)
    
    XCTAssertEqual(result.count, 2)
    XCTAssertEqual(result.first?.displayName, "Alabama, US")
    XCTAssertEqual(result.last?.displayName, "Albuquerque, US")
  }
  
  func testFilterCitiesWithPrefixAlb() {
    let filter = "Alb"
    let result = useCase.execute(cities: generalCities, filter: filter)
    
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result.first?.displayName, "Albuquerque, US")
  }
}
