//
//  ViewController.swift
//  VariousViews
//
//  Created by Hayoung Park on 2018. 4. 29..
//  Copyright © 2018년 Hayoung Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var settingViewModel: SettingViewModel!
    
    @IBOutlet weak var listButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingViewModel = SettingViewModel(id: "Hayoung Park", isPopupShutDown: true, isVideoAutoStart: false, isAutoMoveToHomeSwitch: true)

        listButton.addTarget(self, action: #selector(ViewController.showWebtoonList), for: .touchUpInside)
    }
    
    @objc func showWebtoonList() {
        let vc = ListViewController(nibName: "ListViewController", bundle: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingVC = segue.destination as? SettingViewController {
            settingVC.viewModel = self.settingViewModel
            settingVC.delegate = self
        }
    }
}

extension ViewController: SettingViewControllerDelegate {
    func settingViewSwitchValueChanged(_ sender: UISwitch) {
        guard let identifier = sender.restorationIdentifier else { return }
        
        switch identifier {
        case "popupShutDownSwitch":
            settingViewModel.isPopupShutDown = sender.isOn; break;
        case "videoAutoStartSwitch":
            settingViewModel.isVideoAutoStart = sender.isOn; break;
        case "autoMoveToHomeSwitch":
            settingViewModel.isAutoMoveToHomeSwitch = sender.isOn; break;
        default:
            break
        }
    }
}
