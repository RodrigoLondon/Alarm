
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Lewis Jones on 24/07/2018.
//  Copyright © 2018 Lewis Jones. All rights reserved.
//

//import UIKit
//
//
//protocol SwitchTableViewCellDelegate: class {
//    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
//}
//
//class SwitchTableViewCell: UITableViewCell {
//
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var switchLabel: UISwitch!
//
//
//
//
//    func updateViews() {
//        guard let alarm = alarm else { return }
//        timeLabel.text = alarm.fireTimeAsString
//        nameLabel.text = alarm.name
//        switchLabel.isOn = alarm.enabled
//    }
//
//
//    weak var delegate: SwitchTableViewCellDelegate?
//
//    var alarm: Alarm? {
//        didSet {
//            updateViews()
//        }
//    }
//
//
//    @IBAction func switchValueChanged(_ sender: UISwitch) {
//
//        delegate?.switchCellSwitchValueChanged(cell: self)
//    }
//
//}
//

//class AlarmTableViewCell: UITableViewCell{
//
//    var alarm: Alarm?{
//        didSet{
//            updateViews()
//        }
//    }
//
//    weak var delegate: AlarmTableViewCellDelegate?
//
//
//    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var alarmSwitch: UISwitch!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//    func updateViews(){
//        guard let alarm = alarm else {return}
//
//        nameLabel.text = alarm.name
//        timeLabel.text = alarm.fireTimeAsString
//        alarmSwitch.isOn = alarm.enabled
//    }
//
//
//    @IBAction func alarmSwitched(_ sender: UISwitch) {
//        delegate?.alarmWasToggled(sender: self)
//    }
//
//}
