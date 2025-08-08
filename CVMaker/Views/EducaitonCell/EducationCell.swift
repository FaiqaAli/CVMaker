//
//  EducationCell.swift
//  CVMaker
//
//  Created by faiqa on 8/7/25.
//

import UIKit

class EducationCell: UITableViewCell {
    
    @IBOutlet weak var degreeTextField: UITextField!
    @IBOutlet weak var institutionTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    
    var onEducationChanged: ((EducationEntry) -> Void)?
    
    
    func configure (with entry: EducationEntry) {
        degreeTextField.text = entry.degree
        institutionTextField.text = entry.institution
        yearTextField.text = entry.year
        
        
        [degreeTextField, institutionTextField, yearTextField].forEach {
            $0?.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        }
    }
    
    @objc private func textChanged() {
        let updated = EducationEntry(
            degree: degreeTextField.text ?? "",
            institution: institutionTextField.text ?? "",
            year: yearTextField.text ?? ""
        )
        onEducationChanged?(updated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
