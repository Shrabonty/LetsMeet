//
//  CountryDialCode.swift
//  LetsMeet
//
//  Created by Shrabonty Biswas on 18.04.24.
//

import Foundation
class CountryDailcode : Codable, Identifiable{
    
   let name : String
   let flag : String
   let number : String
    
    static let allCountryCodes : [CountryDailcode] = Bundle.main.decode("countryDialCode.json")
}

extension Bundle {
    
    func decode<T : Codable> (_ file : String)-> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("There is an Error in \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else { fatalError("There is an Error in \(url)")
            
        }
        
        let decoder = JSONDecoder()
        
        guard let countries = try? decoder.decode(T.self, from: data) else {fatalError("There is a problem in parsing Data")}
        
        return countries
    }
}
