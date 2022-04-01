//
//  SettingsVC.swift
//  FlowCoordinators_2021
//
//  Created by Kent Franks on 11/15/21.
//

import UIKit

class SettingsVC: UIViewController, VCProtocol {
    var settingsVM: SettingsVMProtocol?
    
    private var logoutButton: UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(self.logoutButtonAction), for: .touchUpInside)
        button.center = view.center
        return button
    }

    required init(viewModel: VMProtocol) {
        self.settingsVM = viewModel as? SettingsVMProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: UI
    private func setupUI() {
        self.title = "Settings"
        view.backgroundColor = .purple
        view.addSubview(logoutButton)
    }
    
    // MARK: Actions
    @objc private func logoutButtonAction() {
        settingsVM?.logout()
    }
}
