//
//  NetworkHelper.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation

enum Router: String {
    case spaceNews = "https://api.spaceflightnewsapi.net/v4/articles/?format=json&limit=100"
    case astronomyPictureOfTheDay = "https://api.nasa.gov/planetary/apod?count=100&api_key=DEMO_KEY"
    case marsPhotos = "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos"
    case apodapod = "https://api.nasa.gov/planetary/apod"
    case spaceprograms = "https://ll.thespacedevs.com/2.2.0/program/?format=json&limit=22"
    case launches = "https://ll.thespacedevs.com/2.2.0/launch/upcoming/?limit=30"
    //case previousLaunches = "https://ll.thespacedevs.com/2.2.0/launch/previous/?format=json&limit=30&mode=list"
    case events = "https://ll.thespacedevs.com/2.2.0/event/previous/?format=json&limit=30"
    //case upcomingEvents = "https://ll.thespacedevs.com/2.2.0/event/upcoming/?format=json&limit=30"
    //case spaceReports = "https://api.spaceflightnewsapi.net/v4/reports/?format=json&limit=100"
    //case spaceBlogs = "https://api.spaceflightnewsapi.net/v4/blogs/?format=json&limit=100"
    
    var requiresApiKey: Bool {
           switch self {
           case .apodapod, .marsPhotos:
               return true
           default:
               return false
        }
    }
}

let apiKey = "DEMO_KEY"


