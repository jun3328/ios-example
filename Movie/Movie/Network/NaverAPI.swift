//
//  NaverAPI.swift
//  Movie
//
//  Created by lee on 2021/01/25.
//
import Alamofire
import Moya

enum NaverApi {
    case searchMovie(query: String)
}

extension NaverApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com")!
    }
    
    var path: String {
        switch self {
        case .searchMovie:
            return "/v1/search/movie.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchMovie(let query):
            return .requestParameters(parameters: ["query" : query], encoding: URLEncoding.default)
        }
    }
    
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    var headers: [String : String]? {
        return ["X-Naver-Client-Id": "2hwcA1ugtWbaW32vZ3rx", "X-Naver-Client-Secret": "Y6srjNpOHc"]
    }
}
