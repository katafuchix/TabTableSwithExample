//
//  PaidMemberItemCell.swift
//  mitsumitsu_iOS
//
//  Created by k.katafuchi on 2022/09/06.
//  Copyright © 2022 Smart Routine Corp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PaidMemberItemCell: UITableViewCell {

    static let height: CGFloat = 150.0
    
    @IBOutlet weak var copyLabel: UILabel!
    @IBOutlet weak var registButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.configure()
    }

    func configure() {
        self.copyLabel.numberOfLines = 1
        self.copyLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.copyLabel.layer.shadowOpacity = 1
        self.copyLabel.layer.shadowRadius = 6
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag() // ここで毎回生成
    }
}
