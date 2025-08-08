//
//  ProfileCell.swift
//  CVMaker
//
//  Created by faiqa on 8/6/25.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var linksTextField: UITextField!
    @IBOutlet weak var introTextView: UITextView!

    
    var onProfileChanged: ((CVProfile) -> Void)?
    private var profile = CVProfile(name: "", contact: "", email: "", address: "", links: "", intro: "")
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.addTarget(self, action: #selector(nameChanged), for: .editingChanged)
        contactTextField.addTarget(self, action: #selector(contactChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        addressTextField.addTarget(self, action: #selector(addressChanged), for: .editingChanged)
        linksTextField.addTarget(self, action: #selector(linksChanged), for: .editingChanged)
        introTextView.delegate = self
    }
    
    
    func configure(with profile: CVProfile) {
        self.profile = profile
        nameTextField.text = profile.name
        contactTextField.text = profile.contact
        emailTextField.text = profile.email
        addressTextField.text = profile.address
        linksTextField.text = profile.links
        introTextView.text = profile.intro
    }
    
    
    @objc func nameChanged() {
        profile.name = nameTextField.text ?? ""
        onProfileChanged?(profile)
    }
    
    
    @objc func contactChanged() {
        profile.contact = contactTextField.text ?? ""
        onProfileChanged?(profile)
    }
    
    @objc func emailChanged() {
        profile.email = emailTextField.text ?? ""
        onProfileChanged?(profile)
    }

    @objc func addressChanged() {
        profile.address = addressTextField.text ?? ""
        onProfileChanged?(profile)
    }

    @objc func linksChanged() {
        profile.links = linksTextField.text ?? ""
        onProfileChanged?(profile)
    }
    
    

    
}


extension ProfileCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        profile.intro = textView.text
        onProfileChanged?(profile)
    }
}
