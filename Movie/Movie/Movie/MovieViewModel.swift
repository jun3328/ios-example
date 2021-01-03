//
//  MovieViewModel.swift
//  Movie
//
//  Created by lee on 2021/01/25.
//
import Alamofire
import Moya
import RxSwift

class MoviewViewModel: BaseViewModel {
    
    var disposeBag = DisposeBag()
        
    let provider = MoyaProvider<NaverApi>()
    
    let movieSubject = BehaviorSubject<[Movie]>(value: [])
    
    func searchMovie(query: String) {
        provider.rx.request(.searchMovie(query: query))
            .subscribe { [weak self] (event) in
                switch event {
                case .success(let response):
                    self?.handleSuccessResponse(response)
                case .error(let error):
                    print(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func handleSuccessResponse(_ response: Response) {
            do {
                let searchResult = try JSONDecoder().decode(MovieResponse.self, from: response.data)
                
                movieSubject.onNext(searchResult.items)
                
                searchResult.items.forEach { (movie) in
                    print("===================")
                    print("제목, \(movie.title)")
                    print("부제, \(movie.subtitle)")
                    print("감독, \(movie.director)")
                    print("배우, \(movie.actor)")
                    print("===================")
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    
    deinit {
        disposeBag = DisposeBag()
    }
}
