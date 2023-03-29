//
//  SearchParametersView.swift
//  MobileMuseum
//
//  Created by Ryder Claybaugh on 3/16/23.
//

import SwiftUI

struct SearchParametersView: View {
    
    @State private var departmentPickerSelection = "The American Wing"
    let departments = ["The American Wing", "Ancient Near Eastern Art", "Arms and Armor", "Arts of Africa, Oceania, and the Americas", "Asian Art", "The Cloisters", "Costume Institute", "Drawings and Prints", "Egyptian Art", "European Paintings", "European Sculpture and Decorative Arts", "Greek and Roman Art", "Islamic Art", "The Libraries", "Medieval Art", "Modern and Cotemporary Art", "Musical Instruments", "Photographs", "Robert Lehman Collection"]
    
    @State private var dateAndEraPickerSelection = "A.D. 1900-Present"
    let datesAndEra = ["A.D. 1900-Present", "A.D. 1800-1900", "A.D. 1600-1800", "1000 B.C.-A.D. 1", "A.D. 1400-1600", "2000-1000 B.C.", "A.D. 500-1000", "A.D 1000-1400", "A.D. 1-500", "8000-2000 B.C."]
    
    @State private var geographicLocationPickerSelection = "United States"
    let geographicLocation = ["Africa", "Asia", "Austria", "Belgium", "Canada", "China", "Cyprus", "Czech Republic", "Democratic Republic of the Congo", "Denmark", "Egypt", "England", "Europe", "France", "Germany", "Greece", "Hungary", "India", "Indonesia", "Iran", "Iraq", "Italy", "Japan", "Korea", "London", "Mali", "Mexico", "Netherlands", "Nigeria", "North and Central America", "Pakistan", "Papua New Guinea", "Peru", "Republic of Ireland", "Roman Empire", "Rome", "Russia", "Scottish", "South America", "Spain", "Sweden", "Switzerland", "Syria", "Thailand", "Tibet", "Turkey", "United Kingdom", "United States"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Department", selection: $departmentPickerSelection) {
                        ForEach(departments, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Date/Era", selection: $dateAndEraPickerSelection) {
                        ForEach(datesAndEra, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Geographic Location", selection: $geographicLocationPickerSelection) {
                        ForEach(geographicLocation, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
//                    Button {
//                        toView(&searchParametersView)
//
//                    } label: {
//                        Text("Confirm Selection")
//                    }
//                    .frame(maxWidth: .infinity)
                }
                Section {
                Label: do {
                    Image(departmentPickerSelection) // Tweak image for Libraries
                }
                }
                .navigationTitle("Search Parameters")
            }
        }
    }
}

struct SearchParametersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchParametersView()
    }
}


