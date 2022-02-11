//
//  Reminder.swift
//  TemplateProject
//
//  Created by Ivan Kopiev on 30.01.2022.
//

import NotificationCenter

struct Notifucka: Codable {
    //MARK: - Properties
    var time: Date = Date()
    var title: String = "Тест"
    var body: String = "Тест"
    var identifier = UUID().uuidString
    
    //MARK: - Helpers
    func getFormmatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Locale.current.isRussian ? "HH:mm" : "h:mm a"
        return formatter.string(from: time)
    }
    
    func isEquale(time: Date) -> Bool {
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: time)
        let hour = calendar.component(.hour, from: time)
        let selfMinute = calendar.component(.minute, from: self.time)
        let selfHour = calendar.component(.hour, from: self.time)
        return minute == selfMinute && hour == selfHour
    }
    
    func getDateComponents() -> DateComponents {Calendar.current.dateComponents([.hour,.minute,.second], from: time)}
    
    init(time: Date) {self.time = time}
    init(){}
    init(time: Date, title: String, body: String) {
        self.title = title
        self.body = body
        self.time = time
    }
}


enum Reminder {
    //MARK: - Properies
    
    static func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    static func getRequest() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { isComplted, _ in
            if isComplted {
                Log.info("Good request")
            } else {
                Log.error("Error request")
            }
        }
    }
    
    static func createNotificatication(for reminder: Notifucka, userInfo: [String:Any] = [:], repeats: Bool = true) {
        let content = UNMutableNotificationContent()
        content.title = reminder.title
        content.body = reminder.body
        content.sound = .default
        content.badge = 1
        content.userInfo = userInfo
        UIApplication.shared.applicationIconBadgeNumber += 1
        
//        let imageName = "applelogo"
//        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "jpg") else { return }
//        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
//        content.attachments = [attachment]
        let triger = UNCalendarNotificationTrigger(dateMatching: reminder.getDateComponents(), repeats: repeats)
        let request = UNNotificationRequest(identifier: reminder.identifier , content: content, trigger: triger)
        UNUserNotificationCenter.current().add(request) { _ in}
    }
}


extension Locale {
  var isRussian: Bool {
    return languageCode == "ru"
  }
}
