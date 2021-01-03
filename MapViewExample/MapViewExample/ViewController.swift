//
//  ViewController.swift
//  MapViewExample
//
//  Created by lee on 2020/08/31.
//  Copyright © 2020 lee. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lbLocation1: UILabel!
    @IBOutlet var lbLocation2: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbLocation1.text = ""
        lbLocation2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }

    func goLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subTitle strSubtitle: String) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.latitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var adress: String = country!
            
            if pm!.locality != nil {
                adress += " "
                adress += pm!.thoroughfare!
            }
            
            self.lbLocation1.text = "현재 위치"
            self.lbLocation2.text = adress
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
            self.lbLocation1.text = ""
            self.lbLocation2.text = ""
            
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.5108269, longitudeValue: 127.029288, delta: 1, title: "강남역", subTitle: "서울시 강남구 테헤란로")
                
            self.lbLocation1.text = "보고 계신 위치"
            self.lbLocation2.text = "한국폴리텍대학 강름캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스펍", subTitle: "서울시 마포구 잔디로 109")
                
            self.lbLocation1.text = "보고 계신 위치"
            self.lbLocation2.text = "이지스퍼블리싱 출판사"
        }
    }
    
}

