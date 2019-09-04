//
//  AlarmController1.swift
//  Alarm
//
//  Created by Lewis Jones on 31/10/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class AlarmController: AlarmScheduler {
    


    static let shared = AlarmController()


   var alarms: [Alarm] = []
//     var alarms = [Alarm]()
//     private var kAlarms = "Alarms"

     init() {
   
        loadfromPersistentStorage()

    }


    func create(name: String, fireDate: Date, enabled: Bool) {

        let alarm = Alarm(fireDate: fireDate, name: name)
        alarm.enabled = enabled
        AlarmController.shared.alarms.append(alarm)
        scheduleUserNotification(for: alarm)

        saveToPersistentStorage()
    }


    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {

         cancelUserNotification(for: alarm)

        alarm.fireDate = fireDate
        alarm.name = name

        scheduleUserNotification(for: alarm)
        saveToPersistentStorage()

    }

    func delete(alarm: Alarm) {
                guard let index = AlarmController.shared.alarms.index(of: alarm) else { return }
                self.cancelUserNotification(for: alarm)
                alarms.remove(at: index)

        saveToPersistentStorage()
            }

    func toggleEnabled(for alarm: Alarm) {
        if alarm.enabled == true {
        alarm.enabled = !alarm.enabled
        saveToPersistentStorage()
        }
    }
    
    static private var persistentAlarmsFilePath: String? {

        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        guard let documentsDirectory = directories.first as NSString? else { return nil }
        return documentsDirectory.appendingPathComponent("Alarms.plist")

    }

    func saveToPersistentStorage() {
        //NSKeyedArchiver.archiveRootObject(self.alarms, toFile: filePath(key: kAlarms))
        NSKeyedArchiver.archiveRootObject(self.alarms, toFile: AlarmController.persistentAlarmsFilePath!)
    }


    func loadfromPersistentStorage() {


        guard let alarms = NSKeyedUnarchiver.unarchiveObject(withFile: AlarmController.persistentAlarmsFilePath!) as? [Alarm] else { return }
        self.alarms = alarms
    }
}


protocol  AlarmScheduler {
    func scheduleUserNotification(for alarm: Alarm)
    func cancelUserNotification(for alarm: Alarm)
}

extension AlarmScheduler {

    func scheduleUserNotification(for alarm: Alarm) {

        let userNotification = UNMutableNotificationContent()
        userNotification.title = "Title"
        userNotification.body = "Body"
        userNotification.sound = UNNotificationSound.default


        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: alarm.fireDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                let request = UNNotificationRequest(identifier: alarm.uuid, content: userNotification, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error{
                        print("Error scheduling local user notifications \(error.localizedDescription)  :  \(error)")
                    }
           }
    }
        func cancelUserNotification(for alarm: Alarm) {
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.uuid])
        }
   
}















