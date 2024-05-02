//
//  Building.swift
//  FriendRadar
//
//  Created by Xin Zhou on 4/29/24.
//

import Foundation
import MapKit
import SwiftData


struct UCBProperty: Identifiable {
    var id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    var user: User?
    
    init(id: UUID = UUID(), name: String, coordinate: CLLocationCoordinate2D, user: User? = nil) {
        self.id = id
        self.name = name
        self.coordinate = coordinate
        self.user = user
    }
}

extension UCBProperty {
    static let UCBProperties = [
        UCBProperty(name: "Bowles Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873357, longitude: -122.253168)),
        UCBProperty(name: "Barker Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87395, longitude: -122.26549)),
        UCBProperty(name: "Doe Memorial Library", coordinate: CLLocationCoordinate2D(latitude: 37.87244, longitude: -122.25956)),
        UCBProperty(name: "Bancroft Library", coordinate: CLLocationCoordinate2D(latitude: 37.8723, longitude: -122.2587)),
        UCBProperty(name: "Wheeler Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87129, longitude: -122.25914)),
        UCBProperty(name: "Sproul Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.25878)),
        UCBProperty(name: "Visitor Center", coordinate: CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.25878)),
        UCBProperty(name: "Alumni House", coordinate: CLLocationCoordinate2D(latitude: 37.86968, longitude: -122.26119)),
        UCBProperty(name: "California Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87189, longitude: -122.26038)),
        UCBProperty(name: "Campanile (Sather Tower)", coordinate: CLLocationCoordinate2D(latitude: 37.872332, longitude: -122.257964)),
        UCBProperty(name: "Campbell Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87298, longitude: -122.25705)),
        UCBProperty(name: "Dwinelle Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87058, longitude: -122.26041)),
        UCBProperty(name: "Durham Studio Theater", coordinate: CLLocationCoordinate2D(latitude: 37.870515, longitude: -122.260722)),
        UCBProperty(name: "2232 Piedmont Ave.", coordinate: CLLocationCoordinate2D(latitude: 37.870805, longitude: -122.253027)),
        UCBProperty(name: "Eshleman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.868761, longitude: -122.260471)),
        UCBProperty(name: "Demography", coordinate: CLLocationCoordinate2D(latitude: 37.870805, longitude: -122.253027)),
        UCBProperty(name: "Boalt Hall / Law School", coordinate: CLLocationCoordinate2D(latitude: 37.86992, longitude: -122.25341)),
        UCBProperty(name: "Valley Life Sciences Building", coordinate: CLLocationCoordinate2D(latitude: 37.87148, longitude: -122.26211)),
        UCBProperty(name: "Life Sciences Addition", coordinate: CLLocationCoordinate2D(latitude: 37.87139, longitude: -122.26325)),
        UCBProperty(name: "Moffitt Undergraduate Library", coordinate: CLLocationCoordinate2D(latitude: 37.87255, longitude: -122.26081)),
        UCBProperty(name: "Li Ka Shing Center", coordinate: CLLocationCoordinate2D(latitude: 37.8730, longitude: -122.2654)),
        UCBProperty(name: "Wurster Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8705, longitude: -122.25488)),
        UCBProperty(name: "Kroeber Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86988, longitude: -122.2552)),
        UCBProperty(name: "Evans Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87363, longitude: -122.25783)),
        UCBProperty(name: "Stanley Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87404, longitude: -122.25609)),
        UCBProperty(name: "Recreational Sports Facility", coordinate: CLLocationCoordinate2D(latitude: 37.868652, longitude: -122.262897)),
        UCBProperty(name: "Spieker Aquatics Complex", coordinate: CLLocationCoordinate2D(latitude: 37.868809, longitude: -122.262122)),
        UCBProperty(name: "Haas Pavilion", coordinate: CLLocationCoordinate2D(latitude: 37.8694, longitude: -122.26222)),
        UCBProperty(name: "Tolman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874125, longitude: -122.263922)),
        UCBProperty(name: "Koshland Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87394, longitude: -122.26487)),
        UCBProperty(name: "Morgan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873164, longitude: -122.264198)),
        UCBProperty(name: "Genetics and Plant Biology", coordinate: CLLocationCoordinate2D(latitude: 37.873513, longitude: -122.264751)),
        UCBProperty(name: "Mulford Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87264, longitude: -122.26449)),
        UCBProperty(name: "Hilgard Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873164, longitude: -122.263405)),
        UCBProperty(name: "Henry H. Wheeler Brain Imaging Center", coordinate: CLLocationCoordinate2D(latitude: 37.873744, longitude: -122.262983)),
        UCBProperty(name: "Giannini Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87357, longitude: -122.26234)),
        UCBProperty(name: "Wellman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872982, longitude: -122.262729)),
        UCBProperty(name: "University House", coordinate: CLLocationCoordinate2D(latitude: 37.874536, longitude: -122.262077)),
        UCBProperty(name: "Haviland Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87374, longitude: -122.26105)),
        UCBProperty(name: "Starr East Asian Library", coordinate: CLLocationCoordinate2D(latitude: 37.87357, longitude: -122.26034)),
        UCBProperty(name: "North Gate Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874974, longitude: -122.259826)),
        UCBProperty(name: "Blum Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8748, longitude: -122.25914)),
        UCBProperty(name: "McCone Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873996, longitude: -122.25966)),
        UCBProperty(name: "Hesse Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874167, longitude: -122.259247)),
        UCBProperty(name: "O'Brien Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874483, longitude: -122.259094)),
        UCBProperty(name: "McLaughlin Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873829, longitude: -122.259051)),
        UCBProperty(name: "Sutardja Dai Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874822, longitude: -122.258389)),
        UCBProperty(name: "Davis Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87452, longitude: -122.25829)),
        UCBProperty(name: "Bechtel Engineering Center", coordinate: CLLocationCoordinate2D(latitude: 37.87425, longitude: -122.25807)),
        UCBProperty(name: "Cory Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87505, longitude: -122.25752)),
        UCBProperty(name: "Hearst Greek Theatre", coordinate: CLLocationCoordinate2D(latitude: 37.87355, longitude: -122.25432)),
        UCBProperty(name: "Hearst Memorial Mining Building", coordinate: CLLocationCoordinate2D(latitude: 37.87446, longitude: -122.25727)),
        UCBProperty(name: "Donner Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87463, longitude: -122.25649)),
        UCBProperty(name: "Foothill Residence Halls", coordinate: CLLocationCoordinate2D(latitude: 37.875429, longitude: -122.255763)),
        UCBProperty(name: "Le Conte Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87249, longitude: -122.25688)),
        UCBProperty(name: "Birge Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87219, longitude: -122.25724)),
        UCBProperty(name: "Tan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8731, longitude: -122.25642)),
        UCBProperty(name: "Gilman Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87265, longitude: -122.25629)),
        UCBProperty(name: "Giauque Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872446, longitude: -122.25587)),
        UCBProperty(name: "Hildebrand Hall", coordinate: CLLocationCoordinate2D(latitude: 37.872895, longitude: -122.255532)),
        UCBProperty(name: "Lewis Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873009, longitude: -122.254878)),
        UCBProperty(name: "Latimer Hall", coordinate: CLLocationCoordinate2D(latitude: 37.873215, longitude: -122.255835)),
        UCBProperty(name: "Pimentel Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87341, longitude: -122.25602)),
        UCBProperty(name: "Dwinelle Annex", coordinate: CLLocationCoordinate2D(latitude: 37.87035, longitude: -122.26123)),
        UCBProperty(name: "Durant Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87126, longitude: -122.26013)),
        UCBProperty(name: "Cesar E. Chavez Student Center", coordinate: CLLocationCoordinate2D(latitude: 37.8698, longitude: -122.26015)),
        UCBProperty(name: "Zellerbach Hall", coordinate: CLLocationCoordinate2D(latitude: 37.869048, longitude: -122.261226)),
        UCBProperty(name: "Martin Luther King, Jr. Student Union", coordinate: CLLocationCoordinate2D(latitude: 37.869137, longitude: -122.259614)),
        UCBProperty(name: "Bancroft Dance Studio (2401 Bancroft Way)", coordinate: CLLocationCoordinate2D(latitude: 37.868662, longitude: -122.261202)),
        UCBProperty(name: "Architects & Engineers (A&E)", coordinate: CLLocationCoordinate2D(latitude: 37.870162, longitude: -122.258756)),
        UCBProperty(name: "Old Art Gallery", coordinate: CLLocationCoordinate2D(latitude: 37.87059, longitude: -122.25861)),
        UCBProperty(name: "Anthony Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87069, longitude: -122.25819)),
        UCBProperty(name: "Moses Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87099, longitude: -122.25799)),
        UCBProperty(name: "Barrows Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87006, longitude: -122.25791)),
        UCBProperty(name: "Hearst Field Annex", coordinate: CLLocationCoordinate2D(latitude: 37.86947, longitude: -122.25817)),
        UCBProperty(name: "South Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87133, longitude: -122.25851)),
        UCBProperty(name: "Hargrove Music Library", coordinate: CLLocationCoordinate2D(latitude: 37.87044, longitude: -122.2561)),
        UCBProperty(name: "Calvin Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87099, longitude: -122.25393)),
        UCBProperty(name: "Simon Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86985, longitude: -122.25266)),
        UCBProperty(name: "Hearst Memorial Gymnasium", coordinate: CLLocationCoordinate2D(latitude: 37.86956, longitude: -122.25687)),
        UCBProperty(name: "Bancroft Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.869607, longitude: -122.25582)),
        UCBProperty(name: "International House", coordinate: CLLocationCoordinate2D(latitude: 37.86975, longitude: -122.25145)),
        UCBProperty(name: "California Memorial Stadium", coordinate: CLLocationCoordinate2D(latitude: 37.87132, longitude: -122.2506)),
        UCBProperty(name: "Simpson Center for Student-Athlete High Performance", coordinate: CLLocationCoordinate2D(latitude: 37.87143, longitude: -122.2522)),
        UCBProperty(name: "Lawrence Berkeley National Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.87614, longitude: -122.25082)),
        UCBProperty(name: "Stephens Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87124, longitude: -122.25761)),
        UCBProperty(name: "Morrison Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87087, longitude: -122.25644)),
        UCBProperty(name: "Hertz Hall", coordinate: CLLocationCoordinate2D(latitude: 37.8711, longitude: -122.25567)),
        UCBProperty(name: "Faculty Club", coordinate: CLLocationCoordinate2D(latitude: 37.871783, longitude: -122.255862)),
        UCBProperty(name: "Senior Hall", coordinate: CLLocationCoordinate2D(latitude: 37.871946, longitude: -122.255533)),
        UCBProperty(name: "Women's Faculty Club", coordinate: CLLocationCoordinate2D(latitude: 37.872148, longitude: -122.25487)),
        UCBProperty(name: "Minor Hall", coordinate: CLLocationCoordinate2D(latitude: 37.871525, longitude: -122.254711)),
        UCBProperty(name: "Julia Morgan Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87476, longitude: -122.238312)),
        UCBProperty(name: "Haas School of Business", coordinate: CLLocationCoordinate2D(latitude: 37.87169, longitude: -122.25384)),
        UCBProperty(name: "Cheit Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87169, longitude: -122.25384)),
        UCBProperty(name: "Archaeological Research Facility", coordinate: CLLocationCoordinate2D(latitude: 37.870221, longitude: -122.253821)),
        UCBProperty(name: "Ida Louise Jackson Graduate House", coordinate: CLLocationCoordinate2D(latitude: 37.86809, longitude: -122.254)),
        UCBProperty(name: "Unit 1 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86782, longitude: -122.25512)),
        UCBProperty(name: "Woo Hon Fai Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86871, longitude: -122.255667)),
        UCBProperty(name: "Pacific Film Archive, Berkeley Art Museum and", coordinate: CLLocationCoordinate2D(latitude: 37.869036, longitude: -122.257529)),
        UCBProperty(name: "Berkeley Art Museum and Pacific Film Archive", coordinate: CLLocationCoordinate2D(latitude: 37.870942, longitude: -122.266221)),
        UCBProperty(name: "Underhill Parking Facility & Playing Field", coordinate: CLLocationCoordinate2D(latitude: 37.86705, longitude: -122.25492)),
        UCBProperty(name: "Residential & Student Services Building", coordinate: CLLocationCoordinate2D(latitude: 37.866884, longitude: -122.255849)),
        UCBProperty(name: "Unit 2 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86609, longitude: -122.25477)),
        UCBProperty(name: "Cleary Hall", coordinate: CLLocationCoordinate2D(latitude: 37.866692, longitude: -122.25982)),
        UCBProperty(name: "Unit 3 Resident Hall", coordinate: CLLocationCoordinate2D(latitude: 37.867182, longitude: -122.260358)),
        UCBProperty(name: "Ellsworth Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.865971, longitude: -122.262501)),
        UCBProperty(name: "Haste Street Child Development Center", coordinate: CLLocationCoordinate2D(latitude: 37.865899, longitude: -122.261513)),
        UCBProperty(name: "Tang Center", coordinate: CLLocationCoordinate2D(latitude: 37.867555, longitude: -122.26426)),
        UCBProperty(name: "Office of Public Affairs", coordinate: CLLocationCoordinate2D(latitude: 37.86741, longitude: -122.265581)),
        UCBProperty(name: "Jones Child Study Center", coordinate: CLLocationCoordinate2D(latitude: 37.86572, longitude: -122.2641)),
        UCBProperty(name: "Manville Hall", coordinate: CLLocationCoordinate2D(latitude: 37.865639, longitude: -122.267039)),
        UCBProperty(name: "Banway Building (2111 Bancroft Way)", coordinate: CLLocationCoordinate2D(latitude: 37.86788, longitude: -122.26687)),
        UCBProperty(name: "Parking & Transportation (2150 Kittredge St)", coordinate: CLLocationCoordinate2D(latitude: 37.868565, longitude: -122.26686)),
        UCBProperty(name: "University Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87189, longitude: -122.26635)),
        UCBProperty(name: "2120 Berkeley Way / UC Press", coordinate: CLLocationCoordinate2D(latitude: 37.873092, longitude: -122.267672)),
        UCBProperty(name: "1995 University Ave (Golden Bear Center)", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127)),
        UCBProperty(name: "UC Berkeley Extension", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127)),
        UCBProperty(name: "East Asian Studies, Institute of", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127)),
        UCBProperty(name: "Southeast Asian Studies, Center for", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127)),
        UCBProperty(name: "Summer Session", coordinate: CLLocationCoordinate2D(latitude: 37.87199, longitude: -122.27127)),
        UCBProperty(name: "Energy Biosciences Building", coordinate: CLLocationCoordinate2D(latitude: 37.873911, longitude: -122.266478)),
        UCBProperty(name: "Warren Hall", coordinate: CLLocationCoordinate2D(latitude: 37.874307, longitude: -122.266894)),
        UCBProperty(name: "Natural Resources Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.874892, longitude: -122.266862)),
        UCBProperty(name: "Insectary Greenhouse", coordinate: CLLocationCoordinate2D(latitude: 37.874606, longitude: -122.26739)),
        UCBProperty(name: "Oxford Research Unit", coordinate: CLLocationCoordinate2D(latitude: 37.875366, longitude: -122.267095)),
        UCBProperty(name: "Lower Hearst Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.8753, longitude: -122.26165)),
        UCBProperty(name: "Etcheverry Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87587, longitude: -122.2593)),
        UCBProperty(name: "Soda Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87567, longitude: -122.25871)),
        UCBProperty(name: "Goldman School", coordinate: CLLocationCoordinate2D(latitude: 37.87559, longitude: -122.25804)),
        UCBProperty(name: "Upper Hearst Parking Structure", coordinate: CLLocationCoordinate2D(latitude: 37.87576, longitude: -122.25735)),
        UCBProperty(name: "Stern Hall", coordinate: CLLocationCoordinate2D(latitude: 37.87481, longitude: -122.25553)),
        UCBProperty(name: "Martinez Commons", coordinate: CLLocationCoordinate2D(latitude: 37.866744, longitude: -122.257665)),
        UCBProperty(name: "Anna Head Alumnae Hall", coordinate: CLLocationCoordinate2D(latitude: 37.86637, longitude: -122.25744)),
        UCBProperty(name: "Fox Cottage (2350 Bowditch)", coordinate: CLLocationCoordinate2D(latitude: 37.867561, longitude: -122.256787)),
        UCBProperty(name: "2334 Bowditch / Latin American Studies, Center for", coordinate: CLLocationCoordinate2D(latitude: 37.867743, longitude: -122.256863)),
        UCBProperty(name: "2440 Bancroft Way / Career Center", coordinate: CLLocationCoordinate2D(latitude: 37.868283, longitude: -122.260674)),
        UCBProperty(name: "Magnes Collection of Jewish Art and Life", coordinate: CLLocationCoordinate2D(latitude: 37.8698, longitude: -122.26686)),
        UCBProperty(name: "2521 Channing Way / IRLE", coordinate: CLLocationCoordinate2D(latitude: 37.867318, longitude: -122.257882)),
        UCBProperty(name: "Minor Hall Addition", coordinate: CLLocationCoordinate2D(latitude: 37.871354, longitude: -122.255141)),
        UCBProperty(name: "Clark Kerr Campus", coordinate: CLLocationCoordinate2D(latitude: 37.86442, longitude: -122.2492)),
        UCBProperty(name: "Hellman Tennis Center", coordinate: CLLocationCoordinate2D(latitude: 37.86995, longitude: -122.26514)),
        UCBProperty(name: "Lawrence Hall of Science", coordinate: CLLocationCoordinate2D(latitude: 37.87942, longitude: -122.24662)),
        UCBProperty(name: "Haas Clubhouse", coordinate: CLLocationCoordinate2D(latitude: 37.872505, longitude: -122.246043)),
        UCBProperty(name: "Space Sciences Laboratory", coordinate: CLLocationCoordinate2D(latitude: 37.88071, longitude: -122.24431)),
        UCBProperty(name: "Mathematical Sciences Research Institute (MSRI)", coordinate: CLLocationCoordinate2D(latitude: 37.87981, longitude: -122.24434)),
        UCBProperty(name: "2224 Piedmont Ave", coordinate: CLLocationCoordinate2D(latitude: 37.870983, longitude: -122.253048)),
        UCBProperty(name: "CNMAT (1750 Arch St)", coordinate: CLLocationCoordinate2D(latitude: 37.876666, longitude: -122.264499)),
        UCBProperty(name: "2108 Allston Way", coordinate: CLLocationCoordinate2D(latitude: 37.869401, longitude: -122.267342)),
        UCBProperty(name: "1608 4th Street / Campus Shared Services", coordinate: CLLocationCoordinate2D(latitude: 37.873215, longitude: -122.302267)),
        UCBProperty(name: "1925 Walnut St", coordinate: CLLocationCoordinate2D(latitude: 37.873014, longitude: -122.266787)),
        UCBProperty(name: "Graduate Theological Union", coordinate: CLLocationCoordinate2D(latitude: 37.875544, longitude: -122.261843)),
        UCBProperty(name: "Northern Regional Library Facility", coordinate: CLLocationCoordinate2D(latitude: 37.917643, longitude: -122.334985)),
        UCBProperty(name: "Earthquake Engineering Library", coordinate: CLLocationCoordinate2D(latitude: 37.918328, longitude: -122.332485)),
        UCBProperty(name: "Maxwell Family Field and Stadium Garage", coordinate: CLLocationCoordinate2D(latitude: 37.8723, longitude: -122.25272)),
        UCBProperty(name: "Jacobs Hall", coordinate: CLLocationCoordinate2D(latitude: 37.876039, longitude: -122.258809))
    ]
}

