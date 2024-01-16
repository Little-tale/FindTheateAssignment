// 1, 전체적으로 보이기 오케이
// 2. 영화관 종류에 따른 세그먼트 또는 액션시트
// 3.

import UIKit
import MapKit

// latitude: 37.4824761978647
// longitude: 126.9521680487202


class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    let mapInfo = TheaterList.mapAnnotations
    var region = MKCoordinateRegion()
    var coordinate = CLLocation()
    var anotations: [MKPointAnnotation] = []
    var filter : [MKPointAnnotation] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rightButton = UIBarButtonItem(title: "Filter", style: .plain , target: self, action: #selector(filterAct))
        rightButton.tintColor = .gray
        navigationItem.rightBarButtonItem = rightButton
        
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
    
    @objc func filterAct(){
        // 잊어먹었던 액션 시트 생성법
        // 1. UIAlertController를 이용해 액션시트를 생성한다.
        let alertActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // 2. 액션을 만든다.
        let alerActionOfMega = UIAlertAction(title: "메가박스", style: .default,handler: {_ in self.showMega()})
        let alerActionOfLotte = UIAlertAction(title: "롯데시네마", style: .default)
        let alerActionOfCGV = UIAlertAction(title: "CGV", style: .default)
        let alerActionOfAll = UIAlertAction(title: "전체보기", style: .default)
        //3. 액션을 추가한다.
        alertActionSheet.addAction(alerActionOfMega)
        alertActionSheet.addAction(alerActionOfLotte)
        alertActionSheet.addAction(alerActionOfCGV)
        alertActionSheet.addAction(alerActionOfAll)
        
        //4. 액션 취소 버튼을 추가.
        let alertActionCancel = UIAlertAction(title: "취소", style: .cancel)
        alertActionSheet.addAction(alertActionCancel)
        
        //5. 모달방식으로 전달한다.
        present(alertActionSheet, animated: true)
    }
    
}
// 여기서는 액션을 눌렀을때 처리될 메서드 구현
// 1. 메가박스면 메가박스만 나오게 해야 하는데
    //
extension MapViewController {
    func showMega(){
        
        var tempAnnotation: [MKPointAnnotation] = []
        // 메가만 걸러보는거 테스트
        
        for i in anotations {
            if (i.title?.contains("메가박스") == true) {
                print(i.title!)
                tempAnnotation.append(i)
            }else {
                print("걸러",i.title!)
            }
        }
        mapView.removeAnnotations(mapView.annotations)
        for i in tempAnnotation{
            mapView.addAnnotation(i)
        }
        
    }
}
