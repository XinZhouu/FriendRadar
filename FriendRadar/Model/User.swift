//
//  UserInfo.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/18/24.
//

import Foundation
import SwiftData
import MapKit

@Model
class User {
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var email: String
    var password: String
    var favProperties: [String]
    var friends: [User] // recursive definition
    
    init(name: String, email: String, password: String, favProperties: [String], friends: [User]) {
        self.name = name
        self.email = email
        self.password = password
        self.favProperties = favProperties
        self.friends = friends
    }
}

@Model
class Location {
    @Attribute(.unique) var name: String
    var likes: [User]
    var type: String
    
    init(name: String, likes: [User], type: String) {
        self.name = name
        self.likes = likes
        self.type = type
    }
}

extension Location {
    static let locations = [
        Location(name: "Bowles Hall",likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "hall"),
        Location(name: "Barker Hall",  likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "hall"),
        Location(name: "Doe Memorial Library", likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "library"),
        Location(name: "Bancroft Library", likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "library"),
        Location(name: "Recreational Sports Facility", likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])], type: "gym"),
//        Location(name: "Wheeler Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87129, longitude: -122.25914), likes: [], type: LocType.hall),
//        Location(name: "Sproul Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.25878), likes: [], type: LocType.hall),
//        Location(name: "Visitor Center", coordinate: CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.25878), likes: [], type: LocType.facility),
//        Location(name: "Alumni House", coordinate: CLLocationCoordinate2D(latitude: 37.86968, longitude: -122.26119), likes: [], type: LocType.facility),
//        Location(name: "California Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87189, longitude: -122.26038), likes: [], type: LocType.hall),
//        Location(name: "Sather Tower", coordinate: CLLocationCoordinate2D(latitude: 37.872332, longitude: -122.257964), likes: [], type: LocType.facility),
//        Location(name: "Campbell Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87298, longitude: -122.25705), likes: [], type: LocType.hall),
//        Location(name: "Dwinelle Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87058, longitude: -122.26041), likes: [], type: LocType.hall),
//        Location(name: "Durham Studio Theater", coordinate: CLLocationCoordinate2D(latitude: 37.870515, longitude: -122.260722), likes: [], type: LocType.facility),
//        Location(name: "Eshleman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.868761, longitude: -122.260471), likes: [], type: LocType.hall),
//        Location(name: "Boalt Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86992, longitude: -122.25341), likes: [], type: LocType.hall),
//        Location(name: "Valley Life Sciences Building", coordinate: CLLocationCoordinate2D(latitude: 37.87148, longitude: -122.26211), likes: [], type: LocType.hall),
//        Location(name: "Life Sciences Addition", coordinate: CLLocationCoordinate2D(latitude: 37.87139, longitude: -122.26325), likes: [], type: LocType.hall),
//        Location(name: "Moffitt Undergraduate Library", coordinate: CLLocationCoordinate2D(latitude: 37.87255, longitude: -122.26081), likes: [], type: LocType.library),
//        Location(name: "Li Ka Shing Center", coordinate: CLLocationCoordinate2D(latitude: 37.8730, longitude: -122.2654), likes: [], type: LocType.hall),
//        Location(name: "Wurster Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8705, longitude: -122.25488), likes: [], type: LocType.hall),
//        Location(name: "Kroeber Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86988, longitude: -122.2552), likes: [], type: LocType.hall),
//        Location(name: "Evans Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87363, longitude: -122.25783), likes: [], type: LocType.hall),
//        Location(name: "Stanley Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87404, longitude: -122.25609), likes: [], type: LocType.hall),
//        Location(name: "Recreational Sports Facility", coordinate: CLLocationCoordinate2D(latitude: 37.868652, longitude: -122.262897), likes: [], type: LocType.facility),
//        Location(name: "Spieker Aquatics Complex", coordinate: CLLocationCoordinate2D(latitude: 37.868809, longitude: -122.262122), likes: [], type: LocType.facility),
//        Location(name: "Haas Pavilion", coordinate: CLLocationCoordinate2D(latitude: 37.8694, longitude: -122.26222), likes: [], type: LocType.facility),
//        Location(name: "Tolman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874125, longitude: -122.263922), likes: [], type: LocType.hall),
//        Location(name: "Koshland Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87394, longitude: -122.26487), likes: [], type: LocType.hall),
//        Location(name: "Morgan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873164, longitude: -122.264198), likes: [], type: LocType.hall),
//        Location(name: "Genetics and Plant Biology", coordinate: CLLocationCoordinate2D(latitude: 37.873513, longitude: -122.264751), likes: [], type: LocType.hall),
//        Location(name: "Mulford Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87264, longitude: -122.26449), likes: [], type: LocType.hall),
//        Location(name: "Hilgard Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873164, longitude: -122.263405), likes: [], type: LocType.hall),
//        Location(name: "Giannini Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87357, longitude: -122.26234), likes: [], type: LocType.hall),
//        Location(name: "Wellman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872982, longitude: -122.262729), likes: [], type: LocType.hall),
//        Location(name: "University House", coordinate: CLLocationCoordinate2D(latitude: 37.874536, longitude: -122.262077), likes: [], type: LocType.housing),
//        Location(name: "Haviland Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87374, longitude: -122.26105), likes: [], type: LocType.hall),
//        Location(name: "Starr East Asian Library", coordinate: CLLocationCoordinate2D(latitude: 37.87357, longitude: -122.26034), likes: [], type: LocType.library),
//        Location(name: "North Gate Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874974, longitude: -122.259826), likes: [], type: LocType.hall),
//        Location(name: "Blum Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8748, longitude: -122.25914), likes: [], type: LocType.hall),
//        Location(name: "McCone Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873996, longitude: -122.25966), likes: [], type: LocType.hall),
//        Location(name: "Hesse Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874167, longitude: -122.259247), likes: [], type: LocType.hall),
//        Location(name: "O'Brien Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874483, longitude: -122.259094), likes: [], type: LocType.hall),
//        Location(name: "McLaughlin Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873829, longitude: -122.259051), likes: [], type: LocType.hall),
//        Location(name: "Sutardja Dai Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874822, longitude: -122.258389), likes: [], type: LocType.hall),
//        Location(name: "Davis Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87452, longitude: -122.25829), likes: [], type: LocType.hall),
//        Location(name: "Bechtel Engineering Center", coordinate: CLLocationCoordinate2D(latitude: 37.87425, longitude: -122.25807), likes: [], type: LocType.hall),
//        Location(name: "Cory Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87505, longitude: -122.25752), likes: [], type: LocType.hall),
//        Location(name: "Hearst Greek Theatre", coordinate: CLLocationCoordinate2D(latitude: 37.87355, longitude: -122.25432), likes: [], type: LocType.facility),
//        Location(name: "Hearst Memorial Mining Building", coordinate: CLLocationCoordinate2D(latitude: 37.87446, longitude: -122.25727), likes: [], type: LocType.hall),
//        Location(name: "Donner Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87463, longitude: -122.25649), likes: [], type: LocType.facility),
//        Location(name: "Foothill Residence Halls", coordinate: CLLocationCoordinate2D(latitude: 37.875429, longitude: -122.255763), likes: [], type: LocType.housing),
//        Location(name: "Le Conte Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87249, longitude: -122.25688), likes: [], type: LocType.hall),
//        Location(name: "Birge Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87219, longitude: -122.25724), likes: [], type: LocType.hall),
//        Location(name: "Tan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8731, longitude: -122.25642), likes: [], type: LocType.hall),
//        Location(name: "Gilman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87265, longitude: -122.25629), likes: [], type: LocType.hall),
//        Location(name: "Giauque Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872446, longitude: -122.25587), likes: [], type: LocType.hall),
//        Location(name: "Hildebrand Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872895, longitude: -122.255532), likes: [], type: LocType.hall),
//        Location(name: "Lewis Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873009, longitude: -122.254878), likes: [], type: LocType.hall),
//        Location(name: "Latimer Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873215, longitude: -122.255835), likes: [], type: LocType.hall),
//        Location(name: "Pimentel Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87341, longitude: -122.25602), likes: [], type: LocType.hall),
//        Location(name: "Dwinelle Annex", coordinate: CLLocationCoordinate2D(latitude: 37.87035, longitude: -122.26123),likes: [], type: LocType.hall),
//        Location(name: "Durant Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87126, longitude: -122.26013),likes: [], type: LocType.hall),
//        Location(name: "Cesar E. Chavez Student Center", coordinate: CLLocationCoordinate2D(latitude: 37.8698, longitude: -122.26015), likes: [], type: LocType.facility),
//        Location(name: "Zellerbach Hall", coordinate: CLLocationCoordinate2D(latitude: 37.869048, longitude: -122.261226),likes: [], type: LocType.hall),
//        Location(name: "Martin Luther King, Jr. Student Union", coordinate: CLLocationCoordinate2D(latitude: 37.869137, longitude: -122.259614), likes: [], type: LocType.facility),
//        Location(name: "Bancroft Dance Studio (2401 Bancroft Way)", coordinate: CLLocationCoordinate2D(latitude: 37.868662, longitude: -122.261202), likes: [], type: LocType.facility),
//        Location(name: "Architects & Engineers (A&E)", coordinate: CLLocationCoordinate2D(latitude: 37.870162, longitude: -122.258756), likes: [], type: LocType.facility),
//        Location(name: "Old Art Gallery", coordinate: CLLocationCoordinate2D(latitude: 37.87059, longitude: -122.25861), likes: [], type: LocType.facility),
//        Location(name: "Anthony Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87069, longitude: -122.25819), likes: [], type: LocType.hall),
//        Location(name: "Moses Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87099, longitude: -122.25799), likes: [], type: LocType.hall),
//        Location(name: "Barrows Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87006, longitude: -122.25791), likes: [], type: LocType.hall),
//        Location(name: "Hearst Field Annex", coordinate: CLLocationCoordinate2D(latitude: 37.86947, longitude: -122.25817), likes: [], type: LocType.hall),
//        Location(name: "South Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87133, longitude: -122.25851), likes: [], type: LocType.hall),
//        Location(name: "Hargrove Music Library", coordinate: CLLocationCoordinate2D(latitude: 37.87044, longitude: -122.2561), likes: [], type: LocType.library),
//        Location(name: "Calvin Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87099, longitude: -122.25393), likes: [], type: LocType.facility),
//        Location(name: "Simon Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86985, longitude: -122.25266), likes: [], type: LocType.hall),
//        Location(name: "Hearst Memorial Gymnasium", coordinate: CLLocationCoordinate2D(latitude: 37.86956, longitude: -122.25687), likes: [], type: LocType.facility),
//        Location(name: "Bancroft Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.869607, longitude: -122.25582), likes: [], type: LocType.facility),
//        Location(name: "International House", coordinate: CLLocationCoordinate2D(latitude: 37.86975, longitude: -122.25145), likes: [], type: LocType.housing),
//        Location(name: "California Memorial Stadium", coordinate: CLLocationCoordinate2D(latitude: 37.87132, longitude: -122.2506), likes: [], type: LocType.facility),
//        Location(name: "Lawrence Berkeley National Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87614, longitude: -122.25082), likes: [], type: LocType.facility),
//        Location(name: "Stephens Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87124, longitude: -122.25761), likes: [], type: LocType.hall),
//        Location(name: "Morrison Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87087, longitude: -122.25644), likes: [], type: LocType.hall),
//        Location(name: "Hertz Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8711, longitude: -122.25567), likes: [], type: LocType.hall),
//        Location(name: "Faculty Club", coordinate: CLLocationCoordinate2D(latitude: 37.871783, longitude: -122.255862), likes: [], type: LocType.facility),
//        Location(name: "Senior Hall", coordinate: CLLocationCoordinate2D(latitude: 37.871946, longitude: -122.255533), likes: [], type: LocType.hall),
//        Location(name: "Women's Faculty Club", coordinate: CLLocationCoordinate2D(latitude: 37.872148, longitude: -122.25487), likes: [], type: LocType.facility),
//        Location(name: "Minor Hall", coordinate: CLLocationCoordinate2D(latitude: 37.871525, longitude: -122.254711), likes: [], type: LocType.hall),
//        Location(name: "Julia Morgan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87476, longitude: -122.238312), likes: [], type: LocType.hall),
//        Location(name: "Haas School of Business", coordinate: CLLocationCoordinate2D(latitude: 37.87169, longitude: -122.25384), likes: [], type: LocType.hall),
//        Location(name: "Cheit Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87169, longitude: -122.25384), likes: [], type: LocType.hall),
//        Location(name: "Archaeological Research Facility", coordinate: CLLocationCoordinate2D(latitude: 37.870221, longitude: -122.253821), likes: [], type: LocType.facility),
//        Location(name: "Unit 1 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86782, longitude: -122.25512), likes: [], type: LocType.housing),
//        Location(name: "Woo Hon Fai Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86871, longitude: -122.255667), likes: [], type: LocType.hall),
//        Location(name: "Pacific Film Archive, Berkeley Art Museum and", coordinate: CLLocationCoordinate2D(latitude: 37.869036, longitude: -122.257529),likes: [], type: LocType.facility),
//        Location(name: "Berkeley Art Museum and Pacific Film Archive", coordinate: CLLocationCoordinate2D(latitude: 37.870942, longitude: -122.266221), likes: [], type: LocType.facility),
//        Location(name: "Underhill Parking Facility & Playing Field", coordinate: CLLocationCoordinate2D(latitude: 37.86705, longitude: -122.25492), likes: [], type: LocType.facility),
//        Location(name: "Residential & Student Services Building", coordinate: CLLocationCoordinate2D(latitude: 37.866884, longitude: -122.255849), likes: [], type: LocType.facility),
//        Location(name: "Unit 2 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86609, longitude: -122.25477), likes: [], type: LocType.housing),
//        Location(name: "Cleary Hall", coordinate: CLLocationCoordinate2D(latitude: 37.866692, longitude: -122.25982), likes: [], type: LocType.hall),
//        Location(name: "Unit 3 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.867182, longitude: -122.260358), likes: [], type: LocType.housing),
//        Location(name: "Ellsworth Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.865971, longitude: -122.262501),likes: [], type: LocType.facility),
//        Location(name: "Haste Street Child Development Center", coordinate: CLLocationCoordinate2D(latitude: 37.865899, longitude: -122.261513), likes: [], type: LocType.facility),
//        Location(name: "Tang Center", coordinate: CLLocationCoordinate2D(latitude: 37.867555, longitude: -122.26426), likes: [], type: LocType.facility),
//        Location(name: "Manville Hall", coordinate: CLLocationCoordinate2D(latitude: 37.865639, longitude: -122.267039), likes: [], type: LocType.hall),
//        Location(name: "University Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87189, longitude: -122.26635),likes: [], type: LocType.hall),
//        Location(name: "UC Berkeley Extension", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127), likes: [], type: LocType.hall),
//        Location(name: "East Asian Studies, Institute of", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127), likes: [], type: LocType.facility),
//        Location(name: "Southeast Asian Studies, Center for", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127), likes: [], type: LocType.facility),
//        Location(name: "Energy Biosciences Building", coordinate: CLLocationCoordinate2D(latitude: 37.873911, longitude: -122.266478), likes: [], type: LocType.hall),
//        Location(name: "Warren Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874307, longitude: -122.266894),likes: [], type: LocType.hall),
//        Location(name: "Natural Resources Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.874892, longitude: -122.266862), likes: [], type: LocType.facility),
//        Location(name: "Insectary Greenhouse", coordinate: CLLocationCoordinate2D(latitude: 37.874606, longitude: -122.26739), likes: [], type: LocType.facility),
//        Location(name: "Oxford Research Unit", coordinate: CLLocationCoordinate2D(latitude: 37.875366, longitude: -122.267095), likes: [], type: LocType.facility),
//        Location(name: "Lower Hearst Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.8753, longitude: -122.26165), likes: [], type: LocType.facility),
//        Location(name: "Etcheverry Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87587, longitude: -122.2593), likes: [], type: LocType.hall),
        Location(name: "Soda Hall", likes: [
            User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: []),
            User(name: "Xin Zhou", email: "Xin_zhou@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Wurster Hall", "Sproul Hall"], friends: [])], type: "hall"),
//        Location(name: "Upper Hearst Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.87576, longitude: -122.25735), likes: [], type: LocType.facility),
//        Location(name: "Stern Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87481, longitude: -122.25553), likes: [], type: LocType.hall),
//        Location(name: "Magnes Collection of Jewish Art and Life", coordinate: CLLocationCoordinate2D(latitude: 37.8698, longitude: -122.26686), likes: [], type: LocType.facility),
//        Location(name: "Minor Hall Addition", coordinate: CLLocationCoordinate2D(latitude: 37.871354, longitude: -122.255141), likes: [], type: LocType.facility),
//        Location(name: "Clark Kerr Campus", coordinate: CLLocationCoordinate2D(latitude: 37.86442, longitude: -122.2492), likes: [], type: LocType.hall),
//        Location(name: "Hellman Tennis Center", coordinate: CLLocationCoordinate2D(latitude: 37.86995, longitude: -122.26514), likes: [], type: LocType.facility),
//        Location(name: "Lawrence Hall of Science", coordinate: CLLocationCoordinate2D(latitude: 37.87942, longitude: -122.24662), likes: [], type: LocType.hall),
//        Location(name: "Haas Clubhouse", coordinate: CLLocationCoordinate2D(latitude: 37.872505, longitude: -122.246043), likes: [], type: LocType.facility),
//        Location(name: "Space Sciences Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.88071, longitude: -122.24431), likes: [], type: LocType.facility),
//        Location(name: "CNMAT (1750 Arch St)", coordinate: CLLocationCoordinate2D(latitude: 37.876666, longitude: -122.264499), likes: [], type: LocType.facility),
//        Location(name: "Graduate Theological Union", coordinate: CLLocationCoordinate2D(latitude: 37.875544, longitude: -122.261843), likes: [], type: LocType.facility),
//        Location(name: "Northern Regional Library Facility", coordinate: CLLocationCoordinate2D(latitude: 37.917643, longitude: -122.334985), likes: [], type: LocType.facility),
//        Location(name: "Earthquake Engineering Library", coordinate: CLLocationCoordinate2D(latitude: 37.918328, longitude: -122.332485), likes: [], type: LocType.library),
//        Location(name: "Jacobs Hall", coordinate: CLLocationCoordinate2D(latitude: 37.876039, longitude: -122.258809), likes: [], type: LocType.hall)
    ]
}

extension User {
    static let users = [
        User(name: "Xin Zhou", email: "Xin_zhou@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Wurster Hall", "Sproul Hall"], 
             friends: [User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
                       User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])]),
        User(name: "Jitae Kim", email: "Jitae@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Barren Hall", "Alumni House", "Dwinelle Hall", "Evans Hall"], friends: []),
        User(name: "Andrew Lee", email: "Namwook0921@berkeley.edu", password: "111111", favProperties: ["Soda Hall", "Stanley Hall", "Haas Pavilion", "Dwinelle Hall", "Evans Hall"], friends: [])
    ]
}




