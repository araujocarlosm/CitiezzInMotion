//
//  String+Extension.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 4/01/25.
//

extension String {
  var filteringCriteria : String {
    self.folding(
      options: .diacriticInsensitive,
      locale: .current
    ).trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
  }
}
