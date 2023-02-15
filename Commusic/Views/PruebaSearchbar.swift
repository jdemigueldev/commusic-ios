//
//  PruebaSearchbar.swift
//  Commusic
//
//  Created by Bluyin  on 8/2/23.
//

import SwiftUI

struct PruebaSearchbar: View {
    
    private var listOfCountry = countryList
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    HStack {
                        Text(country.capitalized)
                    }
                }
            }.searchable(text: $searchText)
        }
    }
    //filter function
    var countries: [String] {
        let lcCountries = listOfCountry.map { $0.lowercased() }
        return searchText == "" ? lcCountries : lcCountries.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct PruebaSearchbar_Previews: PreviewProvider {
    static var previews: some View {
        PruebaSearchbar()
    }
}
