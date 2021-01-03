//
//  ListViewController.swift
//  CustomPlist
//
//  Created by lee on 2021/01/14.
//

import UIKit

class ListViewController: UITableViewController, UIApplicationDelegate {

    var src: UITableViewDataSource!
    
    @IBOutlet weak var account: UITextField!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var married: UISwitch!
    
    private let userDefaults = UserDefaults.standard
    
//    private var accountList: [String] {
//        get {
//            return userDefaults.array(forKey: Constant.KEY_ACCOUNT_LIST) as? [String] ?? [String]()
//        }
//    }
    
    private lazy var accountList: [String] = {
        return userDefaults.array(forKey: Constant.KEY_ACCOUNT_LIST) as? [String] ?? [String]()
    }()
    
    private var plist: String {
        get {
            let customProperty = "\(self.account.text!).plist"
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let path = paths[0] as NSString
            return path.strings(byAppendingPaths: [customProperty]).first!
        }
    }
    
    private var defaultPlist: NSDictionary!
    
    private var data: NSDictionary? {
        get {
            return NSDictionary(contentsOfFile: plist)
        }
    }
    
    private var mutableData: NSMutableDictionary {
        get { return NSMutableDictionary(contentsOfFile: plist) ?? NSMutableDictionary() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        if let defaultPListPath = Bundle.main.path(forResource: "UserInfo", ofType: "plist") {
            self.defaultPlist = NSDictionary(contentsOfFile: defaultPListPath)
        }
        
        self.name.text = userDefaults.string(forKey: Constant.KEY_NAME)
        self.married.isOn = userDefaults.bool(forKey: Constant.KEY_MARRIED)
        self.gender.selectedSegmentIndex = userDefaults.integer(forKey: Constant.KEY_GENDER)
        
        if let account = userDefaults.string(forKey: Constant.KEY_SELECTED_ACCOUNT) {
            self.account.text = account
            
            self.name.text = data?[Constant.KEY_NAME] as? String
            self.gender.selectedSegmentIndex = data?[Constant.KEY_GENDER] as? Int ?? 0
            self.married.isOn = data?[Constant.KEY_MARRIED] as? Bool ?? false
        }
        
        if (self.account.text?.isEmpty)! {
            self.account.placeholder = "등록된 계정이 없습니다."
            self.gender.isEnabled = false
            self.married.isEnabled = false
        }
    }
    
    private func setupUI() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        // 피커뷰의 툴바 - 코드로 생성 시 높이만 설정
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
        toolbar.barTintColor = .lightGray
        
        self.account.inputView = picker // 텍스트 필드 인풋을 피커가 담당하게 처리
        self.account.inputAccessoryView = toolbar
        
        let new = UIBarButtonItem()
        new.title = "New"
        new.target = self
        new.action = #selector(newAccount(_:))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone(_:))
        
        toolbar.setItems([new, space, done], animated:true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return super.numberOfSections(in: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            
            alert.addTextField { tf in
                tf.text = self.name.text
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                
                let value = alert.textFields?[0].text

                self.mutableData.setValue(value, forKey: Constant.KEY_NAME)
                self.mutableData.write(toFile: self.plist, atomically: true)
                
                self.name.text = value
            }))
            
            self.present(alert, animated: false, completion: nil)
        }
    }
    
    @objc func newAccount(_ sender: UIPickerView) {
        let alert = UIAlertController(title: "새 계정을 입력하세요", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            $0.placeholder = "ex) abc@gmail.com"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
            if let account = alert.textFields?[0].text {
                self.accountList.append(account)
                self.account.text = account
                
                self.name.text = ""
                self.gender.selectedSegmentIndex = 0
                self.married.isOn = false
                
                self.userDefaults.set(self.accountList, forKey: Constant.KEY_ACCOUNT_LIST)
                self.userDefaults.set(account, forKey: Constant.KEY_SELECTED_ACCOUNT)
                self.userDefaults.synchronize()
            }
        })
        self.present(alert, animated: false, completion: nil)
    }

    @objc func pickerDone(_ sender: UIPickerView) {
        self.view.endEditing(true)
        
        self.name.text = data?[Constant.KEY_NAME] as? String
        self.gender.selectedSegmentIndex = data?[Constant.KEY_GENDER] as? Int ?? 0
        self.married.isOn = data?[Constant.KEY_MARRIED] as? Bool ?? false
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        print("\(value) - changeGender")
        
        mutableData.setValue(value, forKey: Constant.KEY_GENDER)
        mutableData.write(toFile: self.plist, atomically: true)
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        print("\(value) - changeMarried")
        
        mutableData.setValue(value, forKey: Constant.KEY_MARRIED)
        mutableData.write(toFile: self.plist, atomically: true)
    }
}

extension ListViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let account = accountList[row]
        self.account.text = account
        
        userDefaults.set(account, forKey: Constant.KEY_SELECTED_ACCOUNT)
        userDefaults.synchronize()
        
        // 입력 뷰를 닫음
        // self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountList[row]
    }
}

extension ListViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountList.count
    }
}
