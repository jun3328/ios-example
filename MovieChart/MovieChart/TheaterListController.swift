//
//  TheaterListController.swift
//  MovieChart
//
//  Created by lee on 2021/01/03.
//

import UIKit

class TheaterListController: UITableViewController {
    
    var list = [NSDictionary]()
    var startPoint = 0
    
    override func viewDidLoad() {
        callTheaterApi()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_map" {
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            let data = list[path!.row]
            (segue.destination as? TheaterViewController)?.param = data
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        cell.name?.text = obj["상영관명"] as? String
        cell.address?.text = obj["소재지도로명주소"] as? String
        cell.tel?.text = obj["연락처"] as? String
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = list[indexPath.row]["상영관명"] as? String
        print("선택된 영화관 \(name ?? "mola")")
    }
    
    private func callTheaterApi() {
        let requestUrl = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100
        let type = "json"
        
        //http://swiftapi.rubypaper.co.kr:2029/theater/list?s_page=0&s_list=100&type=json
    
        let urlObj: URL! = URL(string: "\(requestUrl)?s_page=\(startPoint))&s_list=\(sList)&type=\(type)")

        do {
            let stringData = try NSString(contentsOf: urlObj, encoding: 0x80_000_422)
            let encData = stringData.data(using: String.Encoding.utf8.rawValue)
            
            do {
                let apiArray = try JSONSerialization.jsonObject(with: encData!, options: []) as? NSArray
                
                for obj in apiArray! {
                    list.append(obj as! NSDictionary)
                }
            } catch {
                let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다.", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                present(alert, animated: false)
            }
            self.startPoint += sList
        } catch  {
            
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            
            present(alert, animated: false)
            
            NSLog("Parse Theator Error!!")
        }
    }
}
