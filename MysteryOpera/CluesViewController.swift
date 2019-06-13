//
//  CluesViewController.swift
//  MysteryOpera
//
//  Created by Robbe Verhoest on 12/06/2019.
//  Copyright © 2019 Robbe Verhoest. All rights reserved.
//

import UIKit
import AVFoundation

class CluesViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var videoPreview: UIView!
    @IBOutlet weak var clueImage: UIImageView!
    
    
    enum error:Error {
        case noCameraAvailable
        case videoInputInitFail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try scanQRCode()
        } catch {
            print("Failed to scan QR Code")
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            let macReadCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if macReadCode.type == AVMetadataObject.ObjectType.qr {
                print(macReadCode.stringValue!)
                
                if macReadCode.stringValue! == "Glas" {
                    clueImage.image = UIImage(named: "personage1")
                } else if macReadCode.stringValue! == "stof" {
                    clueImage.image = UIImage(named: "personage2")
                } else {
                    let alert = UIAlertController(title: macReadCode.stringValue!, message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func scanQRCode() throws {
        let avCaptureSession = AVCaptureSession()
        
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("no camera")
            throw error.noCameraAvailable
        }
        
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else {
            print("failed to init camera")
            throw error.videoInputInitFail
        }
        
        let avCaptureMetaDataOutput = AVCaptureMetadataOutput()
        avCaptureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetaDataOutput)
        
        avCaptureMetaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = videoPreview.bounds
        avCaptureVideoPreviewLayer.connection?.videoOrientation = .landscapeRight
        self.videoPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        
        avCaptureSession.startRunning()
    }

}
