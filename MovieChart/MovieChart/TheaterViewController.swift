//
//  TheaterViewController.swift
//  MovieChart
//
//  Created by lee on 2021/01/03.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var param: NSDictionary!
    
    override func viewDidLoad() {
        self.navigationItem.title = param["상영관명"] as? String
        let lat = (param["위도"] as! NSString).doubleValue
        let lng = (param["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let region = self.mapView.regionThatFits(MKCoordinateRegion(
                                                    center: location,
                                                    latitudinalMeters: 100,
                                                    longitudinalMeters: 100))
        mapView.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        mapView.addAnnotation(point)
    }
}
