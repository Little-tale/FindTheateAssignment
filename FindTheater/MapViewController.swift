//
//  MapViewController.swift
//  FindTheater
//
//  Created by Jae hyung Kim on 1/15/24.
//

import UIKit
import MapKit

// latitude: 37.4824761978647
// longitude: 126.9521680487202
class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    let mapInfo = TheaterList.mapAnnotations
    var region = MKCoordinateRegion()
    var coordinate = CLLocation()
    override func viewDidLoad() {
        super.viewDidLoad()
        var anotations: [MKPointAnnotation] = []
        for theater in mapInfo{
            // anotations.append(theater.location)
            // 빈 어노테이션 생성
            let anotion = MKPointAnnotation()
            // 위경도 이용해 로케이션 생성
            let theaterLocation = CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
            // 빈 어노테이션에 위경도 담긴 로케이션 전달
            //  CLLocationCoordinate2D
            anotion.coordinate = theaterLocation
            anotion.title = theater.location
            
            anotations.append(anotion)
        }
        let testAnotation = MKPointAnnotation()
       
        
        let testCoordinate = CLLocationCoordinate2D(latitude: 37.4824761978647, longitude: 126.9521680487202)
        testAnotation.coordinate = testCoordinate
        
        let testRe = MKCoordinateRegion(center: testCoordinate, latitudinalMeters: 20000, longitudinalMeters: 20000)
        testAnotation.title = "테스트"
        
        mapView.setRegion(testRe, animated: true)
        for item in anotations{
            mapView.addAnnotation(item)
        }
        
    }
    
}
