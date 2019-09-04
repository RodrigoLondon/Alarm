//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by Lewis Jones on 24/07/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

//import UIKit
//
//class AlarmListTableViewController: UITableViewController, SwitchTableViewCellDelegate, AlarmScheduler {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return AlarmController.shared.alarms.count
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell ?? SwitchTableViewCell()
//        
//        cell.alarm = AlarmController.shared.alarms[indexPath.row]
//        cell.updateViews()
//        cell.delegate = self
//        
//        return cell
//    }
//    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            
//            let alarm = AlarmController.shared.alarms[indexPath.row]
//            AlarmController.shared.delete(alarm: alarm)
//            cancelLocalNotification(alarm: alarm)
//            //cancelUserNotifications(for: alarm)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//    
//    
//    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
//        
//        guard let indexPath = tableView.indexPath(for: cell) else { return }
//        let alarm = AlarmController.shared.alarms[indexPath.row]
//        AlarmController.shared.toggleEnabled(for: alarm)
//        
//        if alarm.enabled {
//            scheduleLocalNotification(alarm: alarm)
//        } else {
//            cancelLocalNotification(alarm: alarm)
//        }
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//    }
//    
//   // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       
//        if segue.identifier == "toAlarm" {
//            guard let detailVC = segue.destination as? AlarmDetailTableViewController,
//                let indexPath = tableView.indexPathForSelectedRow else { return }
//            
//            detailVC.alarm = AlarmController.shared.alarms[indexPath.row]
//        }
//        
//        
//    }
// 
//
//}
