
//  AlarmDetailTableViewController1.swift
//  Alarm
//
//  Created by Lewis Jones on 31/10/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {
    

    var alarm: Alarm?{
        didSet{
            loadViewIfNeeded()
            self.updateViews()

        }
    }

    var alarmIsOn: Bool = true



    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var alarmEnabledButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateViews(){

        guard let alarm = alarm else {return}
        alarmIsOn = alarm.enabled
        datePicker.date = alarm.fireDate
        titleTextField.text = alarm.name
        setUpAlarmButton()

    }

    func setUpAlarmButton(){

        switch alarmIsOn {
        case true:
            alarmEnabledButton.backgroundColor = UIColor.green
            alarmEnabledButton.setTitle("ON", for: .normal)
        case false:
            alarmEnabledButton.backgroundColor = UIColor.gray
            alarmEnabledButton.setTitle("Off", for: .normal)
        }
    }

    @IBAction func alarmEnabledButtonTapped(_ sender: UIButton) {
        if let alarm = alarm {
            AlarmController.shared.toggleEnabled(for: alarm)
            alarmIsOn = alarm.enabled
        }else{
            alarmIsOn = !alarmIsOn
        }
        setUpAlarmButton()
    }



    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {

        guard let title = titleTextField.text else {return}
        guard title != "" else {return}

        if let alarm = alarm {
            AlarmController.shared.update(alarm: alarm, fireDate: datePicker.date, name: title, enabled: alarmIsOn)
        } else{
            AlarmController.shared.create(name: title, fireDate: datePicker.date, enabled: alarmIsOn)
        }
        self.navigationController?.popViewController(animated: true)
    }

}















//import UIKit

//class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {
//
//    @IBOutlet weak var datePicker: UIDatePicker!
//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var enableButton: UIButton!
//
//
//   // var alarm: Alarm?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let alarm = alarm {
//            updateWithAlarm()
//
//        }
//
//    setupView()
//    }
//
//    func setupView() {
//
//        if alarm == nil {
//            enableButton.isHidden = true
//        } else {
//            enableButton.isHidden = false
//            if alarm?.enabled == true {
//                enableButton.setTitle("Disable", for: .normal)
//                enableButton.setTitleColor(.white, for: .normal)
//                enableButton.backgroundColor = .red
//            } else {
//                enableButton.setTitle("Enable", for: .normal)
//                enableButton.setTitleColor(.blue, for: .normal)
//                enableButton.backgroundColor = .gray
//            }
//        }
//    }
//
//    func updateWithAlarm() {
//
//        guard let thisMorniAtMidnight = DateHelper.thisMorningAtMidnight else { return }
//        datePicker.setDate(NSDate(timeInterval: (alarm?.fireTimeFromMidnight)!, since: thisMorniAtMidnight) as Date, animated: true)
//        textField.text = alarm?.name
//        self.title = alarm?.name
//
//    }
//
//
//    @IBAction func enableButtonTapped(_ sender: UIButton) {
//
//        guard  let alarm = alarm else { return }
//        AlarmController.shared.toggleEnabled(for: alarm)
//        if alarm.enabled {
//            scheduleLocalNotification(alarm: alarm)
//        } else {
//            cancelLocalNotification(alarm: alarm)
//        }
//        setupView()
//    }
//
//    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
//
//        guard let title = textField.text , let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else { return }
//            let timeIntervalSinceMidnight = datePicker.date.timeIntervalSince(thisMorningAtMidnight)
//        if let alarm = alarm {
//            AlarmController.shared.update(alarm: alarm, fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
//            cancelLocalNotification(alarm: alarm)
//            scheduleLocalNotification(alarm: alarm)
//
//        } else {
//            let alarm = AlarmController.shared.addAlarm(fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
//            self.alarm = alarm
//            scheduleLocalNotification(alarm: alarm)
//
//        }
//        self.navigationController?.popViewController(animated: true)
//    }
//
//
//
//    // MARK: Private
//
//    private func updateViews() {
//
//        guard  let alarm = alarm, let thisMorningMidnight = DateHelper.thisMorningAtMidnight, isViewLoaded else {
//            enableButton.isHidden = true
//            return
//        }
//        datePicker.setDate(Date(timeInterval: alarm.fireTimeFromMidnight, since: thisMorningMidnight), animated: false)
//        textField.text = alarm.name
//
//        enableButton.isHidden =  false
//        if alarm.enabled {
//            enableButton.setTitle("Disable", for: UIControl.State())
//            enableButton.setTitleColor(.white, for: UIControl.State())
//            enableButton.backgroundColor = .red
//        } else {
//            enableButton.setTitle("Enable", for: UIControl.State())
//            enableButton.setTitleColor(.white, for: UIControl.State())
//            enableButton.backgroundColor = .blue
//        }
//        self.title = alarm.name
//    }
//
//    // MARK: Properties
//
//    var alarm: Alarm? {
//        didSet {
//            if isViewLoaded {
//                updateViews()
//            }
//        }
//    }
//
//
//
//
//}
