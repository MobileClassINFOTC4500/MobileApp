//
//  HomeViewController.swift
//  ChoosyNewsy
//
//  Created by Tim Gilman on 4/13/15.
//  Copyright (c) 2015 Tim Gilman. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var navBar: UINavigationBar!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var radiusSlider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in

            if (error != nil) {
                println("Error:" + error.localizedDescription)
        
                return
                
            }
            
            if placemarks.count > 0 {
                
                let pm = placemarks[0] as CLPlacemark
                
                self.displayLocationInfo(pm)
                
                self.navBar.topItem?.title = self.displayLocationTitle(pm)
                
                
            }else {
                
                println("Error with data")
                
            }
            
        })
        
    }
    
    func displayLocationTitle(placemark: CLPlacemark) -> String
    {
        return placemark.locality + ", " + placemark.administrativeArea
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }

    @IBAction func showRadius(sender: AnyObject) {
        var currentValue = radiusSlider.value
        sliderLabel.text = String(format: "%.0f", currentValue) + " miles"
    
    }

    @IBAction func searchLocation(sender: AnyObject) {
        println("Search Functionality")
    }

    @IBAction func goToHistory(sender: AnyObject) {
        println("Go to history page")
    }
    
    
    @IBAction func goToFavorited(sender: AnyObject) {
        println("Go to favorite page")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
