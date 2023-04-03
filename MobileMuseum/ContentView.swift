//
//  ContentView.swift
//  MobileMuseum
//
//  Created by Ryder Claybaugh on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var objects: Objects = Objects(total: 0, id: [0])
    @State private var object: [Object] = []
    
    @State private var loadAmount = 10
    @State private var isArtistHidden = false
    @State private var isCultureHidden = false
    @State private var showLoadButton = false
    
    @State private var search = ""
    @State private var searchParametersView = false
    @State private var navTitle = ""
    @State private var noResults = ""
    @State private var currentIndex = 0
    
    @State private var zoomScale: CGFloat = 1.0
    @State private var previousZoomScale: CGFloat = 1.0
    
    @State private var objectDetailText = ""
    let detailScrollViewColor = Color(red: 242/255, green: 242/255, blue: 247/255)
    let myColor = Color(red: 0.5, green: 0.75, blue: 1.0)
    
    // Search Parameters
    @State private var departmentPickerSelection = "Unspecified"
    let departments = ["Unspecified", "The American Wing", "Ancient Near Eastern Art", "Arms and Armor", "Arts of Africa, Oceania, and the Americas", "Asian Art", "The Cloisters", "Costume Institute", "Drawings and Prints", "Egyptian Art", "European Paintings", "European Sculpture and Decorative Arts", "Greek and Roman Art", "Islamic Art", "The Libraries", "Medieval Art", "Modern and Cotemporary Art", "Musical Instruments", "Photographs", "Robert Lehman Collection"]
    
    var departmentId: String {
        var id = ""
        
        switch id {
        case _ where departmentPickerSelection == "The American Wing" :
            id =  "1"
        case _ where departmentPickerSelection ==  "Ancient Near Eastern Art" :
            id = "3"
        case _ where departmentPickerSelection ==  "Arms and Armor" :
            id = "4"
        case _ where departmentPickerSelection ==  "Arts of Africa, Oceania, and the Americas" :
            id = "5"
        case _ where departmentPickerSelection ==  "Asian Art" :
            id = "6"
        case _ where departmentPickerSelection ==  "The Cloisters" :
            id = "7"
        case _ where departmentPickerSelection ==  "Costume Institute" :
            id = "8"
        case _ where departmentPickerSelection ==  "Drawings and Prints" :
            id = "9"
        case _ where departmentPickerSelection ==  "Egyptian Art" :
            id = "10"
        case _ where departmentPickerSelection ==  "European Paintings" :
            id = "11"
        case _ where departmentPickerSelection ==  "European Sculpture and Decorative Arts" :
            id = "12"
        case _ where departmentPickerSelection ==  "Greek and Roman Art" :
            id = "13"
        case _ where departmentPickerSelection ==  "Islamic Art" :
            id = "14"
        case _ where departmentPickerSelection ==  "Robert Lehman Collection" :
            id = "15"
        case _ where departmentPickerSelection ==  "The Libraries" :
            id = "16"
        case _ where departmentPickerSelection ==  "Medieval Art" :
            id = "17"
        case _ where departmentPickerSelection ==  "Musical Instruments" :
            id = "18"
        case _ where departmentPickerSelection ==  "Photographs" :
            id = "19"
        case _ where departmentPickerSelection ==  "Modern and Cotemporary Art" :
            id = "21"
        case _ where departmentPickerSelection == "Unspecified" :
            id = "Unspecified"
        default :
            id = ""
        }
        return id
    }
    
    @State private var dateAndEraPickerSelection = "Unspecified"
    let datesAndEra = ["Unspecified", "A.D. 1900-Present", "A.D. 1800-1900", "A.D. 1600-1800", "1000 B.C.-A.D. 1", "A.D. 1400-1600", "2000-1000 B.C.", "A.D. 500-1000", "A.D 1000-1400", "A.D. 1-500", "8000-2000 B.C."]
    
    var beginDate: String {
        var date = ""
        
        switch date {
        case _ where dateAndEraPickerSelection == "A.D. 1900-Present" :
            date = "1900"
        case _ where dateAndEraPickerSelection == "A.D. 1800-1900" :
            date = "1800"
        case _ where dateAndEraPickerSelection == "A.D. 1600-1800" :
            date = "1600"
        case _ where dateAndEraPickerSelection == "1000 B.C.-A.D. 1" :
            date = "-1000"
        case _ where dateAndEraPickerSelection == "A.D. 1400-1600" :
            date = "1400"
        case _ where dateAndEraPickerSelection == "2000-1000 B.C." :
            date = "-2000"
        case _ where dateAndEraPickerSelection == "A.D. 500-1000" :
            date = "500"
        case _ where dateAndEraPickerSelection == "A.D 1000-1400" :
            date = "1000"
        case _ where dateAndEraPickerSelection == "A.D. 1-500" :
            date = "1"
        case _ where dateAndEraPickerSelection == "8000-2000 B.C." :
            date = "-8000"
        case _ where dateAndEraPickerSelection == "Unspecified" :
            date = "Unspecified"
        default:
            date = ""
        }
        
        return date
    }
    
    var endDate: String {
        var date = ""
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: currentDate)
        
        switch date {
        case _ where dateAndEraPickerSelection == "A.D. 1900-Present" :
            date = yearString
        case _ where dateAndEraPickerSelection == "A.D. 1800-1900" :
            date = "1900"
        case _ where dateAndEraPickerSelection == "A.D. 1600-1800" :
            date = "1800"
        case _ where dateAndEraPickerSelection == "1000 B.C.-A.D. 1" :
            date = "1"
        case _ where dateAndEraPickerSelection == "A.D. 1400-1600" :
            date = "1600"
        case _ where dateAndEraPickerSelection == "2000-1000 B.C." :
            date = "-1000"
        case _ where dateAndEraPickerSelection == "A.D. 500-1000" :
            date = "1000"
        case _ where dateAndEraPickerSelection == "A.D 1000-1400" :
            date = "1400"
        case _ where dateAndEraPickerSelection == "A.D. 1-500" :
            date = "500"
        case _ where dateAndEraPickerSelection == "8000-2000 B.C." :
            date = "-2000"
        case _ where dateAndEraPickerSelection == "Unspecified" :
            date = "Unspecified"
        default:
            date = ""
        }
        
        return date
    }
    
    @State private var geographicLocationPickerSelection = "Unspecified"
    let geographicLocation = ["Unspecified", "Africa", "Asia", "Austria", "Belgium", "Canada", "China", "Cyprus", "Czech Republic", "Democratic Republic of the Congo", "Denmark", "Egypt", "England", "Europe", "France", "Germany", "Greece", "Hungary", "India", "Indonesia", "Iran", "Iraq", "Italy", "Japan", "Korea", "London", "Mali", "Mexico", "Netherlands", "Nigeria", "North and Central America", "Pakistan", "Papua New Guinea", "Peru", "Republic of Ireland", "Roman Empire", "Rome", "Russia", "Scottish", "South America", "Spain", "Sweden", "Switzerland", "Syria", "Thailand", "Tibet", "Turkey", "United Kingdom", "United States"]
    
    var body: some View {
        NavigationView {
            Form {
                if searchParametersView == false {
                    Section {
// MARK: Search Functionality
                        TextField("        EX. Helmet, Chair, Pottery", text: $search)
                            .font(.custom("Hoefler Text", size: 18))
                            .onSubmit {
                                objects.id.removeAll()
                                objects.total = 0
                                object.removeAll()
                                loadAmount = 10
                                if objects.id.isEmpty == false && object.isEmpty == false {
                                    object.removeAll()
                                }
                                fetchObjects(searchTerm: search, departmentId: departmentId, geolocation: geographicLocationPickerSelection, beginDate: beginDate, endDate: endDate, completion: { result in
                                    switch result {
                                    case .success(let objects):
                                        self.objects = objects
                                    case .failure(let error):
                                        print(error)
                                    }
                                })
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    for index in 0..<min(objects.id.count, loadAmount) {
                                        let objectId = objects.id[index]
                                        getObjectInfo(objectId: objectId, completion: { result in
                                            switch result {
                                            case .success(let object):
                                                self.object.append(object)
                                                if currentIndex < index {
                                                    currentIndex = index
                                                }
                                            case .failure(let error):
                                                print(error)
                                            }
                                        })
                                    }
                                    
                                    if search != "" && objects.total > 10 {
                                        showLoadButton = true
                                    } else {
                                        showLoadButton = false
                                    }
                                    if objects.total == 0 {
                                        noResults = "No Results"
                                    } else {
                                        noResults = ""
                                    }
                                }
                            }
                        
                            .overlay(
                            HStack {
                                if search.isEmpty {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 0)
                                }
                            })
                    } // Section end
                    ZStack {
                        Color.red
                            .frame(height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        Section {
                            Button(action: {
                                    objects.id.removeAll()
                                    objects.total = 0
                                    object.removeAll()
                                    loadAmount = 10
                                    if objects.id.isEmpty == false && object.isEmpty == false {
                                        object.removeAll()
                                    }
                                    fetchObjects(searchTerm: search, departmentId: departmentId, geolocation: geographicLocationPickerSelection, beginDate: beginDate, endDate: endDate, completion: { result in
                                        switch result {
                                        case .success(let objects):
                                            self.objects = objects
                                        case .failure(let error):
                                            print(error)
                                        }
                                    })
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        for index in 0..<min(objects.id.count, loadAmount) {
                                            let objectId = objects.id[index]
                                            getObjectInfo(objectId: objectId, completion: { result in
                                                switch result {
                                                case .success(let object):
                                                    self.object.append(object)
                                                    if currentIndex < index {
                                                        currentIndex = index
                                                    }
                                                case .failure(let error):
                                                    print(error)
                                                }
                                            })
                                        }
                                        
                                        if search != "" && objects.total > 10 {
                                            showLoadButton = true
                                        } else {
                                            showLoadButton = false
                                        }
                                        if objects.total == 0 {
                                            noResults = "No Results"
                                        } else {
                                            noResults = ""
                                        }
                                    }
                            }) {
                                Text("Search")
                                    .font(.custom("Al Nile Bold", size: 21))
                            }
                            .buttonStyle(.borderedProminent)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .accentColor(.red)
                            .padding(.top, +5)
                        }
                    }
                    .padding(.top, -10)
                    .padding(.bottom, +10)
                    .listRowBackground(Color.clear)
// MARK: Search Parameters 'segue'
                    ZStack {
                        Section {
                            Button(action: {
                                toggleView(&searchParametersView)
                                navTitle = "Search Parameters"
                                objects.id.removeAll()
                                objects.total = 0
                                object.removeAll()
                                search = ""
                                showLoadButton = false
                            }) {
                                Text("Parameters")
                                    .font(.custom("Hoefler Text", size: 21))
                            }
                            .buttonStyle(.automatic)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                        }
                    }
                    .listRowBackground(Color.clear)
                    Section {
                        if noResults != "" {
                            Text(noResults)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .font(.custom("Hoefler Text", size: 18))
                            
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    Section {
                        List(object, id: \.objectID) { object in
                            VStack(alignment: .center) {
// MARK: Detail View
                                NavigationLink {
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 15) {
                                            Spacer()
                                            AsyncImage(url: URL(string: object.primaryImage)) { image in image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .scaleEffect(zoomScale)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .scaledToFit()
                                            .frame(width: 300, height: 400)
                                            ForEach(object.additionalImages, id: \.self) { imageUrl in
                                                AsyncImage(url: URL(string: imageUrl)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                .frame(width: 300, height: 400)
                                            }
                                            Spacer()
                                        }
                                        .background(detailScrollViewColor)
                                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                        .padding(15)
                                    }
                                    ScrollView(.vertical) {
                                        VStack(spacing: 10) {
                                                Text("Date:")
                                                    .font(.custom("Al Nile Bold", size: 18))
                                                Text(object.objectDate)
                                                    .font(.custom("Hoefler Text", size: 18))

                                                
                                                Text("Artist:")
                                                    .font(.custom("Al Nile Bold", size: 18))
                                                if object.artistDisplayName == "" || object.artistDisplayName == nil {
                                                    Text("Artist N/A")
                                                        .font(.custom("Hoefler Text", size: 18))
                                                } else {
                                                    Text(object.artistDisplayName!)
                                                        .font(.custom("Hoefler Text", size: 18))
                                                }
                                                
                                                Text("Culture:")
                                                    .font(.custom("Al Nile Bold", size: 18))
                                                if object.culture == "" || object.culture == nil {
                                                    Text("Culture N/A")
                                                        .font(.custom("Hoefler Text", size: 18))
                                                } else {
                                                    Text(object.culture!)
                                                        .font(.custom("Hoefler Text", size: 18))
                                                }
                                                
                                                
                                                Text("Medium:")
                                                    .font(.custom("Al Nile Bold", size: 18))
                                                Text(object.medium)
                                                    .font(.custom("Hoefler Text", size: 18))
                                                
                                                Text("Dimensions:")
                                                    .font(.custom("Al Nile Bold", size: 18))
                                                Text(object.dimensions)
                                                    .font(.custom("Hoefler Text", size: 18))
                                                
                                                    .navigationTitle(object.objectName)
                                            }
                                            .padding()
                                            .background(detailScrollViewColor)
                                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                            .padding(10)
                                        }
                                } label: {
// MARK: Row Parameters
                                    VStack {
                                        Spacer()
                                        AsyncImage(url: URL(string: object.primaryImage)) { image in image
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                                                .frame(width: 300, height: 300)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
//                                        Text(String(object.objectID)).foregroundColor(.red)
                                        Spacer()
                                        VStack {
                                            Spacer()
                                            Text(object.objectName)
                                            Spacer()
                                            Text(object.objectDate)
                                            Spacer()
                                            if object.artistDisplayName == "" || object.artistDisplayName == nil {
                                                Text("Artist N/A")
                                            } else {
                                                Text(object.artistDisplayName!)
                                            }
                                            Spacer()
                                            if object.culture == "" || object.culture == nil {
                                                Text("Culture N/A")
                                            } else {
                                                Text(object.culture!)
                                            }
                                            Spacer()
                                        }
                                        .font(.custom("Hoefler Text", size: 18))
                                    }
                                }
                            }
                        }
                        
// MARK: Load More Button
                        if showLoadButton == true {
                            Button("Load More") {
                                loadMore(&loadAmount)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    for index in (currentIndex+1)..<min(objects.id.count, loadAmount) {
                                        if currentIndex < index {
                                            currentIndex = index
                                        }
                                        let objectId = objects.id[index]
                                        getObjectInfo(objectId: objectId, completion: { result in
                                            switch result {
                                            case .success(let object):
                                                self.object.append(object)
                                            case .failure(let error):
                                                print(error)
                                            }
                                        })
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                            .font(.custom("Hoefler Text", size: 18))
                        }
                    }
                } // if false end
                
// MARK: Search Parameters
                if searchParametersView == true {
                    
                    Section {
                        Picker(selection: $departmentPickerSelection, label: Text("Department").font(.custom("Al Nile Bold", size: 18))) {
                            ForEach(departments, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker(selection: $dateAndEraPickerSelection, label: Text("Date/Era").font(.custom("Al Nile Bold", size: 18))) {
                            ForEach(datesAndEra, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker(selection: $geographicLocationPickerSelection, label: Text("Geographic Location").font(.custom("Al Nile Bold", size: 18))) {
                            ForEach(geographicLocation, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    ZStack {
                        Color.red
                            .frame(height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        Section {
                            Button {
                                toggleView(&searchParametersView)
                                navTitle = ""
                            } label: {
                                Text("Confirm Selection")
                                    .font(.custom("Al Nile Bold", size: 18))
                                    .padding(.top, +5)
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        }
                    }
                    .listRowBackground(Color.clear)
                    Section {
                    Label: do {
                            Image(departmentPickerSelection)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                .padding(.bottom, 30)
                                .animation(.easeInOut)
                    }
                        if departmentPickerSelection == "Unspecified" {
                            Text("")
                                .animation(.easeInOut)
                        } else if departmentPickerSelection == "The American Wing" {
                            Text("The Metropolitan Museum of Art is situated in Lenapehoking, homeland of the Lenape diaspora, and historically a gathering and trading place for many diverse Native Peoples, who continue to live and work on this island. We respectfully acknowledge and honor all Indigenous communities—past, present, and future—for their ongoing and fundamental relationships to the region.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Ever since its establishment in 1870, the Museum has acquired important examples of American art. A separate 'American Wing' to display the domestic arts of the seventeenth to early nineteenth centuries opened in 1924; painting and sculpture galleries and a skylit courtyard were added in 1980.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Today, the Wing's ever-evolving collection comprises some 20,000 works of art by African American, Euro American, Latin American, and Native American men and women. Ranging from the colonial to early-modern periods, the holdings include painting, sculpture, works on paper, and decorative arts—including furniture, textiles, ceramics, glass, silver, metalwork, jewelry, basketry, quill and bead embroidery—as well as historical interiors and architectural fragments.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Monumental sculpture, stained glass, and architectural elements are installed in the Charles Engelhard Court; silver, gold, glass, and ceramics on the courtyard balconies. Narratives of American domestic architecture and furnishings, 1680–1915, are explored in twenty historical interiors, or period rooms. Changing rotations of painting, sculpture, works on paper, and textiles appear throughout the Wing.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                        } else if departmentPickerSelection == "Ancient Near Eastern Art" {
                            Text("The Met's Department of Ancient Near Eastern Art cares for approximately 7,000 works ranging in date from the eighth millennium B.C. through the centuries just beyond the emergence of Islam in the seventh century A.D. Objects in the collection were created by people in the area that today comprises Iraq, Iran, Turkey, Syria, the Eastern Mediterranean coast, Yemen, and Central Asia. From the art of some of the world's first cities to that of great empires, the department's holdings illustrate the beauty and craftsmanship as well as the profound interconnections, cultural and religious diversity, and lasting legacies that characterize the ancient art of this vast region.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Arms and Armor" {
                            Text("The principal goals of the Arms and Armor Department are to collect, preserve, research, publish, and exhibit distinguished examples representing the art of the armorer, swordsmith, and gunmaker. Arms and armor have been a vital part of virtually all cultures for thousands of years, pivotal not only in conquest and defense, but also in court pageantry and ceremonial events. Throughout time the best armor and weapons have represented the highest artistic and technical capabilities of the society and period in which they were made, forming a unique aspect of both art history and material culture.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The Met collection of arms and armor is a modern one, formed through the activities and interests of curators, trustees, private collectors, and donors over the past 125 years. The collection comprises approximately fourteen thousand objects, of which more than five thousand are European, two thousand are from the Near East, and four thousand from the Far East. It is one of the most comprehensive and encyclopedic collections of its kind.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Arts of Africa, Oceania, and the Americas" {
                            Text("Nearly 1,600 objects from Africa, the Pacific Islands, and the Americas are on view in The Metropolitan Museum of Art's Michael C. Rockefeller Wing. They span 3,000 years, three continents, and many islands, and represent a rich diversity of cultural traditions.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Highlights of the collection include works from the Court of Benin in Nigeria and sculpture from West and Central Africa; wood sculpture from New Guinea and the island groups of Melanesia and Polynesia; and gold, ceramic, and stone objects from the Precolumbian cultures of Mexico and Central and South America. These collections are of varied materials and types, and range from ritual sculpture to gold and silver ornaments, costumes and textiles, impressive ceremonial figures, and monuments of wood and stone.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Asian Art" {
                            Text("The Department of Asian Art fulfills a unique role at The Met by representing the artistic achievements of six major cultural traditions that encompass 5,000 years of history, half the world's population, more than twenty modern nations, and a vast region that ranges from Afghanistan, the Indian subcontinent, and Southeast Asia across the Himalayas to China, Korea, and Japan.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The Met's collection of Asian art—more than 35,000 objects, ranging in date from the third millennium B.C. to the twenty-first century—is one of the largest and most comprehensive in the world. Each of the many civilizations of Asia is represented by outstanding works, providing an unrivaled experience of the artistic traditions of nearly half the world. ")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("As Asia becomes ever more important on the world’s stage, the need to understand its diverse cultures and rich history becomes increasingly important. We at The Met want to do our part to make Asia more accessible by celebrating the ways in which the past continues to inform and enrich the present. We invite you to share in that adventure by exploring this page.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "The Cloisters" {
                            Text("Opened in 1938 as a branch of The Metropolitan Museum of Art, The Met Cloisters is America’s only museum dedicated exclusively to the art and architecture of the Middle Ages. Including a museum and gardens within a single complex, it picturesquely overlooks the Hudson River in Fort Tryon Park in northern Manhattan and derives its name from the portions of five medieval cloisters incorporated into a modern museum structure. Not replicating any one particular medieval building type or setting, but rather designed to evoke the architecture of the later Middle Ages, The Met Cloisters creates an integrated and harmonious context in which visitors can experience the rich tradition of medieval artistic production, including metalwork, painting, sculpture, and textiles. By definition, a cloister consists of a covered walkway surrounding a large open courtyard that provides access to other monastic buildings. Similarly, the museum’s cloisters act as passageways to galleries; they provide as inviting a place for rest and contemplation for visitors as they often did in their original monastic settings.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Costume Institute" {
                            Text("The Costume Institute's collection of more than thirty-three thousand objects represents seven centuries of fashionable dress and accessories for men, women, and children, from the fifteenth century to the present.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Drawings and Prints" {
                            Text("The Department’s vast collection of works on paper comprises approximately 21,000 drawings, 1.2 million prints, and 12,000 illustrated books created in Europe and the Americas from about 1400 to the present day. Since its foundation in 1916, the Department has been committed to collecting a wide range of works on paper, which includes both pieces that are incredibly rare and lauded for their aesthetic appeal, as well as material that is more popular, functional, and ephemeral. The broad scope of the department’s collecting encourages questions of connoisseurship as well as those pertaining to function and context, and demonstrates the vital role that prints, drawings, and illustrated books have played throughout history. ")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Egyptian Art" {
                            Text("The Met collection of ancient Egyptian art consists of approximately 26,000 objects of artistic, historical, and cultural importance, dating from the Paleolithic to the Roman period (ca. 300,000 B.C.–A.D. 4th century). More than half of the collection is derived from the Museum's thirty-five years of archaeological work in Egypt, initiated in 1906 in response to increasing Western interest in the culture of ancient Egypt.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "European Paintings" {
                            Text("The Met’s celebrated European Paintings collection encompasses more than 2,500 works of art from the thirteenth through the early twentieth century. In addition to the department’s galleries, pictures hang in the Robert Lehman Collection, the Jack and Belle Linsky Collection, and in other departmental galleries at The Met Fifth Avenue, as well as at The Met Cloisters.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Apart from individual masterpieces by artists as diverse as Jan van Eyck, Caravaggio, and Gustav Klimt, The Met possesses a rich display of early Italian and Northern art, along with one of the world’s greatest collections of seventeenth-century Dutch paintings, including outstanding works by Frans Hals, Rembrandt, and Johannes Vermeer. The Museum's holdings of El Greco and Goya are the finest outside of Spain. Its galleries of nineteenth-century French paintings are second only to the museums of Paris, presenting in depth the art of Gustave Courbet, Edgar Degas, Édouard Manet, Claude Monet, Paul Cézanne, Vincent van Gogh, and others.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The collection traces its origins to the Museum’s founding purchase of 174 paintings from European dealers in 1871. Since then, numerous donations, bequests, and curatorial purchases have greatly enriched the department’s holdings. In recent years, the department has built up a notable collection of seventeenth-century Italian painting; acquired an unrivalled survey of plein-air oil sketches from the decades before Impressionism; and expanded its display of nineteenth-and early twentieth-century Northern and Central European art. As it grows, the collection reflects our constantly evolving ideas about art history and offers new opportunities for discovery by the public and scholars alike.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "European Sculpture and Decorative Arts" {
                            Text("The fifty thousand objects in the Museum's comprehensive and historically important collection of European sculpture and decorative arts reflect the development of a number of art forms in Western European countries from the early fifteenth through the early twentieth century. The holdings include sculpture in many sizes and media, woodwork and furniture, ceramics and glass, metalwork and jewelry, horological and mathematical instruments, and tapestries and textiles. Ceramics made in Asia for export to European markets and sculpture and decorative arts produced in Latin America during this period are also included among these works.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Greek and Roman Art" {
                            Text("The Museum's collection of Greek and Roman art comprises more than thirty thousand works ranging in date from the Neolithic period (ca. 4500 B.C.) to the time of the Roman emperor Constantine's conversion to Christianity in A.D. 312. It includes the art of many cultures and is among the most comprehensive in North America. The geographic regions represented are Greece and Italy, but not as delimited by modern political frontiers: Greek colonies were established around the Mediterranean basin and on the shores of the Black Sea, and Cyprus became increasingly Hellenized. For Roman art, the geographical limits coincide with the expansion of the Roman Empire. The department also exhibits the art of prehistoric Greece (Helladic, Cycladic, and Minoan) and pre-Roman art of Italic peoples, notably the Etruscans.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Islamic Art" {
                            Text("The Met's collection of Islamic art ranges in date from the seventh to the twenty-first century. Its more than 15,000 objects reflect the great diversity and range of the cultural traditions of Islam, with works from as far westward as Spain and Morocco and as far eastward as Central Asia and Indonesia. Comprising both sacred and secular objects, the collection reveals the mutual influence of artistic practices such as calligraphy, and the exchange of motifs such as vegetal ornament (the arabesque) and geometric patterning in both realms.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "The Libraries" {
                            Text("Thomas J. Watson Library is The Met's research library. With its collection of more than one million volumes, extensive digital collections, and online resources, Watson Library is one of the world's most comprehensive art libraries.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The Library's holdings reflect the global and encyclopedic nature of The Met, with books ranging in date from the late fifteenth century, to current scholarship, in all fields covered by The Met. Last year the Library added more than twenty thousand titles in sixty-seven languages.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Medieval Art" {
                            Text("The Museum's collection of medieval and Byzantine art is among the most comprehensive in the world. Displayed in both The Met Fifth Avenue and in the Museum's branch in northern Manhattan, The Met Cloisters, the collection encompasses the art of the Mediterranean and Europe from the fall of Rome in the fourth century to the beginning of the Renaissance in the early sixteenth century. It also includes pre-medieval European works of art created during the Bronze Age and early Iron Age.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Modern and Cotemporary Art" {
                            Text("The Modern and Contemporary Art department at The Met is devoted to the study, collection and exhibition of art from 1890 to the present. An era marked by seismic cultural, social and political shifts across the globe, artistic responses to these changes have shaped multiple modernities and diverse contemporary practices. The department is committed to foregrounding the interconnected and richly variegated narratives and experiences that inform the art of this period from around the world.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Historically focused on the art of Western Europe and North America, since 2012 Modern and Contemporary Art has greatly expanded and diversified its collections, especially through works by women and artists of color, with particular emphasis on acquisitions from Latin America, South Asia, the Middle East, North Africa, Turkey, and African diasporas. Today, its holdings span a range of media, including paintings, sculpture, works on paper, design, decorative arts, and time-based media. The department presents rotating selections from its dynamic collections in its galleries and special projects throughout the museum.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The department’s robust acquisitions program is complemented by a variety of other activities, including special exhibitions, site-specific commissions by contemporary artists, collaborations within and beyond the museum, collections care through regular maintenance, cataloguing, study, and research initiatives, including the support of fellows and interns.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Musical Instruments" {
                            Text("The Met is home to one of the world's most diverse and important collections of musical instruments. With more than five thousand examples from six continents, it is unsurpassed in its scope and includes instruments from all cultures and eras. Now, for the first time, the instruments can be heard in the galleries via dynamic kiosks and a musical Audio Guide.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Photographs" {
                            Text("Established as an independent curatorial department in 1992, The Met's Department of Photographs houses a collection of more than seventy-five thousand works spanning the history of photography from its invention in the 1830s to the present. Among the treasures from the early years of the medium are a rare album of photographs by William Henry Fox Talbot made just months after he presented his invention to the public; a large collection of portrait daguerreotypes by the Boston firm of Southworth and Hawes; landscape photographs of the American West by Timothy O'Sullivan and Carleton Watkins; and fine examples of French photography from the 1850s by Edouard Baldus, Charles Nègre, Gustave Le Gray, Henri Le Secq, Nadar, and others.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        } else if departmentPickerSelection == "Robert Lehman Collection" {
                            Text("The Robert Lehman Collection is one of the most distinguished privately assembled art collections in the United States. Robert Lehman's bequest to The Met, a collection of extraordinary quality and breadth acquired over the course of sixty years, is a remarkable example of twentieth-century American collecting. Spanning seven hundred years of western European art, from the fourteenth to the twentieth centuries, the 2,600 works include paintings, drawings, manuscript illumination, sculpture, glass, textiles, antique frames, maiolica, enamels, and precious jeweled objects.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("The collection of approximately three hundred paintings is particularly rich in the field of the Italian Renaissance, notably the Sienese school, as well as early Northern European works. Included in the 750 Old Master drawings ranging from the fifteenth to the twentieth centuries is a significant group of eighteenth-century Venetian works, as well as other distinguished Italian, French, and Northern European examples. The collection is also renowned in several areas of decorative arts: Renaissance maiolica, Venetian glass, and antique frames.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                                .padding(.bottom, +40)
                            Text("Robert Lehman's parents, Philip and Carrie Lehman, laid the foundation for the collection around 1905, when they began acquiring works of art for their recently completed townhouse on West 54th Street in New York City. Robert Lehman assembled his collection with scholarly knowledge, astute connoisseurship, and skillful negotiation of the art market. Upon his death in 1969, he bequeathed 2,600 works to The Met with the stipulation that they be exhibited as a private collection, reflecting his belief that 'important works of art, privately owned, should be beyond one's own private enjoyment and [that] the public at large should be afforded some means of seeing them.' A new wing, erected to display the collection, opened to the public in 1975. The Robert Lehman Wing includes a central skylit gallery surrounded by a series of rooms intended to recreate the Lehman family residence. Velvet wall coverings, draperies, furniture, and rugs evoke the ambience of private interiors and serve as a backdrop for this extraordinary collection.")
                                .font(.custom("Hoefler Text", size: 18))
                                .lineSpacing(20)
                        }
                    }
                    .listRowBackground(Color.clear)
                } // if true end
            } // Form end
            .navigationTitle(navTitle)
        } // nav view end
        .accentColor(.red)
    } // body some view end
} // struct content view end

func loadMore(_ loadAmount: inout Int) {
    loadAmount += 10
}

func toggleView(_ newView: inout Bool) {
    newView.toggle()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
