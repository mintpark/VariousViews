//
//  ViewController.swift
//  VariousViews
//
//  Created by Hayoung Park on 2018. 4. 29..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

struct SettingViewModel {
    var id: String
    var isPopupShutDown: Bool
    var isVideoAutoStart: Bool
    var isAutoMoveToHomeSwitch: Bool
}

protocol SettingViewControllerDelegate: NSObjectProtocol {
    func settingViewSwitchValueChanged(_ sender: UISwitch)
}

class SettingViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var popupShutDownSwitch: UISwitch!
    @IBOutlet weak var videoAutoStartSwitch: UISwitch!
    @IBOutlet weak var autoMoveToHomeSwitch: UISwitch!
    
    var delegate: SettingViewControllerDelegate?
    
    var viewModel: SettingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { return }
        
        // viewModel을 prepareForSegue에서 넣어주면 뷰가 완전히 로드되지 않은 상태에서 ibOutlet이 업데이트 되어, 여기서 bind해줌.
        idLabel.text = viewModel.id
        popupShutDownSwitch.isOn = viewModel.isPopupShutDown
        videoAutoStartSwitch.isOn = viewModel.isVideoAutoStart
        autoMoveToHomeSwitch.isOn = viewModel.isAutoMoveToHomeSwitch
    }
    
    @IBAction func changeSwitchValue(_ sender: UISwitch) {
        switch sender {
        case popupShutDownSwitch:
            viewModel?.isPopupShutDown = sender.isOn; break;
        case videoAutoStartSwitch:
            viewModel?.isVideoAutoStart = sender.isOn; break;
        case autoMoveToHomeSwitch:
            viewModel?.isAutoMoveToHomeSwitch = sender.isOn; break;
        default:
            break
        }
        
        delegate?.settingViewSwitchValueChanged(sender)
    }
}

