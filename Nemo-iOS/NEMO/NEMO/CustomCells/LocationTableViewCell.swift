//
//  LocationTableViewCell.swift
//  NEMO
//
//  Created by Manar Magdy on 11/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension LocationTableViewCell: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse {
            locationManager?.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "current location"
        mapView.addAnnotation(annotation)
    }
}


