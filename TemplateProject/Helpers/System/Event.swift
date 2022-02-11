//
//  Event.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 11.02.2022.
//

//import Firebase
//
//class Event: NSObject {
//
//    enum Name: String {
//        case event_name
//    }
//
//    static func initFirebase() {
//        FirebaseApp.configure()
//    }
//    static func log(event: Event.Name, param: [String:Any]? = nil) {
//        Analytics.logEvent(event.rawValue, parameters: param)
//    }
//
//    static func logWithDate(event: Event.Name) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy HH:mm"
//        let now = formatter.string(from: Date())
//        Analytics.logEvent(event.rawValue, parameters: ["date": now])
//    }
//}
