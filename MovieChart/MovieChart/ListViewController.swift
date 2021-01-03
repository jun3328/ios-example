import UIKit

class ListViewController: UITableViewController {
        
    var repoList = [GithubRepoVO]()
    
    var page = 1
    
    @IBOutlet var moreButton: UIButton!
    
    override func viewDidLoad() {
        callGithubApi()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            // 사용자가 클릭한 행을 찾는다.
            let path = self.tableView.indexPath(for: sender as! RepoCell)
            
            let detailVC = segue.destination as? DetailViewController
            detailVC?.repository = repoList[path!.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = repoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! RepoCell
        
        cell.title?.text = repo.title
        cell.desc?.text = repo.description
        cell.language?.text = repo.language
        cell.rating?.text = "평점 \(repo.rating!)"
        
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        }
        //let imageData = try! Data(contentsOf: URL(string: movie.thumbnail!)!)
        //cell.thumbnail.image = UIImage(data: imageData)
        //cell.thumbnail.image = UIImage(named: movie.thumbnail!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번쨰 행입니다.")
    }
    
    @IBAction func loadMore(_ sender: UIButton) {
        page += 1
        callGithubApi()
        self.tableView.reloadData()
    }
    
    private func callGithubApi() {
        let apiUrl: URL! = URL(string: "https://api.github.com/search/repositories?q=google&page=\(page)&per_page=10&sort=stars")
        let apiData = try! Data(contentsOf: apiUrl)
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
        
        NSLog("API Result = \(log)")
        
        do {
            let apiDcitionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            if (page > 3) {
                moreButton.isHidden = true
            }
            let items = apiDcitionary["items"] as! NSArray
            
            for row in items {
                let r = row as! NSDictionary
                
                let repo = GithubRepoVO()
                repo.title = r["name"] as? String
                repo.description = r["description"] as? String
                repo.language = r["language"] as? String
                
                let owner = r["owner"] as! NSDictionary
                repo.thumbnail = owner["avatar_url"] as? String
                repo.url = r["html_url"] as? String
                
                let imageData = try! Data(contentsOf: URL(string: repo.thumbnail!)!)
                repo.thumbnailImage = UIImage(data: imageData)
                
                repo.rating = 7.77
                repoList.append(repo)
            }
            self.tableView.reloadData()
        } catch  {
            NSLog("Parse Error!!")
        }
    }
    
    
    private func getThumbnailImage(_ index: Int) -> UIImage {
        let repo = repoList[index]
        
        if let savedImage = repo.thumbnailImage {
            return savedImage
        } else {
            let imageData = try! Data(contentsOf: URL(string: repo.thumbnail!)!)
            repo.thumbnailImage = UIImage(data: imageData)
            return repo.thumbnailImage!
        }
    }
}

