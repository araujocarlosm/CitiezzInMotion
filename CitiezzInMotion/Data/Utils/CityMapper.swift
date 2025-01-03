//
//  CityMapper.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

struct CityMapper {
  static func mapToDomain(from dto: CityDTO) -> CityEntity {
    return CityEntity(city: dto)
  }
  
  static func toDTO(_ domain: CityEntity) -> CityDTO {
    return CityDTO(
      country: domain.country,
      name: domain.name,
      id: domain.id,
      coord: domain.coord
    )
  }
}
