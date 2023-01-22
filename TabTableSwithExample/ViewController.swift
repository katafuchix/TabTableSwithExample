//
//  ViewController.swift
//  TabTableSwithExample
//
//  Created by cano on 2023/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var basicTableView: UITableView!
    @IBOutlet weak var premiumTableView: UITableView!
    @IBOutlet weak var basicPlanView: UIView!
    @IBOutlet weak var basicPlanLabel: UILabel!
    @IBOutlet weak var premiumPlanView: UIView!
    @IBOutlet weak var premiumPlanLabel: UILabel!
    
    enum RowNumber: Int, CaseIterable{
        // プラン
        case plan12_1
        case plan6_1
        case plan3_1
        
        var identifier: String {
            switch self {
            case .plan12_1: return "PaidMemberItemCell"
            case .plan6_1: return "PaidMemberItemCell"
            case .plan3_1: return "PaidMemberItemCell"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setUpViews()
        self.bind()
    }

    private func setUpViews() {
        
        self.makeRound(self.premiumPlanView)
        self.makeRound(self.basicPlanView)
        
        // セル登録
        RowNumber.allCases.filter{ $0.identifier != "" }.forEach {
            let nibHeader = UINib(nibName: $0.identifier, bundle: nil)
            self.basicTableView.register(nibHeader, forCellReuseIdentifier: $0.identifier)
            self.premiumTableView.register(nibHeader, forCellReuseIdentifier: $0.identifier)
        }
        self.basicTableView.reloadData()
        self.premiumTableView.reloadData()
    }

    func makeRound(_ view: UIView) {
        //左上と右上を角丸
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    func bind() {
        let basicTapGesture = UITapGestureRecognizer()
        self.basicPlanView.addGestureRecognizer(basicTapGesture)

        basicTapGesture.rx.event.bind(onNext: { [unowned self] recognizer in
            self.basicPlanLabel.textColor = .black
            self.premiumPlanLabel.textColor = .systemGray5
            self.basicTableView.isHidden = false
            self.premiumTableView.isHidden = true
        }).disposed(by: rx.disposeBag)
        
        
        let premiumTapGesture = UITapGestureRecognizer()
        self.premiumPlanView.addGestureRecognizer(premiumTapGesture)

        premiumTapGesture.rx.event.bind(onNext: { [unowned self] recognizer in
            self.basicPlanLabel.textColor = .lightGray
            self.premiumPlanLabel.textColor = .black
            self.basicTableView.isHidden = true
            self.premiumTableView.isHidden = false
        }).disposed(by: rx.disposeBag)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.basicTableView:
            return RowNumber.allCases.count
        case self.premiumTableView:
            return RowNumber.allCases.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //if indexPath.row > self.datasource.count { return UITableViewCell() }
        
        switch tableView {
        case self.basicTableView:
            switch(indexPath.row) {
            // 12ヶ月プラン
            case RowNumber.plan12_1.rawValue, RowNumber.plan12_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "12"
                cell.priceLabel.text = "2,900"
                cell.priceTextLabel.text = "（一括支払い：34,800円）"
                cell.copyLabel.text = "一番おすすめ！"
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                return cell
            
            // 6ヶ月プラン
            case RowNumber.plan6_1.rawValue, RowNumber.plan6_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "6"
                cell.priceLabel.text = "4,133"
                cell.priceTextLabel.text = "（一括支払い：24,800円）"
                cell.copyLabel.text = "おすすめ！"
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                return cell
                
            // 3ヶ月プラン
            case RowNumber.plan3_1.rawValue, RowNumber.plan3_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "3"
                cell.priceLabel.text = "4,933"
                cell.priceTextLabel.text = "（一括支払い：14,800円）"
                cell.copyLabel.text = "まずはお試し！"
                cell.copyLabel.sizeToFit()
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                return cell
                
            default:
                return UITableViewCell()
            }
        case self.premiumTableView:
            switch(indexPath.row) {
            // 12ヶ月プラン
            case RowNumber.plan12_1.rawValue, RowNumber.plan12_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "12"
                cell.priceLabel.text = "2,900"
                cell.priceTextLabel.text = "（一括支払い：34,800円）"
                cell.copyLabel.text = "一番おすすめ！"
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                cell.contentView.backgroundColor = .systemBrown
                return cell
            
            // 6ヶ月プラン
            case RowNumber.plan6_1.rawValue, RowNumber.plan6_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "6"
                cell.priceLabel.text = "4,133"
                cell.priceTextLabel.text = "（一括支払い：24,800円）"
                cell.copyLabel.text = "おすすめ！"
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                cell.contentView.backgroundColor = .systemBrown
                return cell
                
            // 3ヶ月プラン
            case RowNumber.plan3_1.rawValue, RowNumber.plan3_1.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: PaidMemberItemCell.identifier(), for: indexPath) as! PaidMemberItemCell
                cell.monthLabel.text = "3"
                cell.priceLabel.text = "4,933"
                cell.priceTextLabel.text = "（一括支払い：14,800円）"
                cell.copyLabel.text = "まずはお試し！"
                cell.copyLabel.sizeToFit()
                
                cell.registButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in

                }).disposed(by: cell.disposeBag)
                
                cell.contentView.backgroundColor = .systemBrown
                return cell
                
            default:
                return UITableViewCell()
            }

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)  {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row) {
            
        case RowNumber.plan12_1.rawValue, RowNumber.plan6_1.rawValue, RowNumber.plan3_1.rawValue:
            return PaidMemberItemCell.height

        default:
            return UITableView.automaticDimension
        }
    }
    
}

