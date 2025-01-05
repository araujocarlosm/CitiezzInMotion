//
//  SortCitiesUseCaseTests.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//
import XCTest
@testable import CitiezzInMotion

final class SortCitiesUseCaseTests: XCTestCase {
  private var useCase: SortCitiesUseCase!
  private let latamCities = latamDTOs.map { CityMapper.mapToDomain(from: $0) }
  private let generalCities = generalDTOs.map { CityMapper.mapToDomain(from: $0) }
  
  override func setUp() {
    super.setUp()
    useCase = SortCitiesUseCase()
  }
  
  override func tearDown() {
    useCase = nil
    super.tearDown()
  }
  
  func testSortCitiesAscending() {
    let sorted = useCase.execute(cities: latamCities)
    XCTAssertEqual(sorted.first?.displayName, "Asuncion, Paraguay")
    XCTAssertEqual(sorted.last?.displayName, "São Paulo, Brasil")
  }
  
  func testSortCitiesDescending() {
    let sorted = useCase.execute(cities: latamCities, sortCriteria: .descending)
    XCTAssertEqual(sorted.first?.displayName, "São Paulo, Brasil")
    XCTAssertEqual(sorted.last?.displayName, "Asuncion, Paraguay")
  }
  
  func testSortCitiesAscendingGeneral() {
    let sorted = useCase.execute(cities: generalCities)
    XCTAssertEqual(sorted.first?.displayName, "Alabama, US")
    XCTAssertEqual(sorted.last?.displayName, "Sydney, AU")
  }
  
  func testSortCitiesDescendingGeneral() {
    let sorted = useCase.execute(cities: generalCities, sortCriteria: .descending)
    XCTAssertEqual(sorted.first?.displayName, "Sydney, AU")
    XCTAssertEqual(sorted.last?.displayName, "Alabama, US")
  }
}
