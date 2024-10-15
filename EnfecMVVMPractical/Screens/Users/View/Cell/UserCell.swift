//
//  UserCell.swift
//  EnfecMVVMPractical
//
//  Created by Paras Modi on 15/10/24.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    static var identifier: String { return String(describing: self)}
    static var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: UserCellViewModel? {
        
        didSet {
            lblID.text = cellViewModel?.id
            lblLat.text = cellViewModel?.lat
            lblLong.text = cellViewModel?.lng
            lblCompanyName.text = cellViewModel?.companyname
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        lblID.text = nil
        lblLat.text = nil
        lblLong.text = nil
        lblCompanyName.text = nil
    }
}
