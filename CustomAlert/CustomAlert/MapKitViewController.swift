//
//  MapKitViewController.swift
//  CustomAlert
//
//  Created by lee on 2021/01/12.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let mapKitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.view = mapKitView
        self.preferredContentSize.height = 200
        
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623) // 위치정보
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) // 지도에 보여줄 넓이
        
        let region = MKCoordinateRegion(center: pos, span: span) // 지도 뷰에 표시
        
        mapKitView.region = region
        mapKitView.regionThatFits(region)
        
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapKitView.addAnnotation(point)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
