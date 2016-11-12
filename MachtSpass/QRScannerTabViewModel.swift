//
//  QRScannerTabViewModel.swift
//  MachtSpass
//
//  Created by Peter Christian Glade on 12.11.16.
//  Copyright © 2016 BaconLove. All rights reserved.
//

import Foundation
import RxSwift
import QRCodeReader
import AVFoundation

class QRScannerTabViewModel {
    fileprivate let disposeBag: DisposeBag
    
    fileprivate let qrContent = Variable<String?>(nil)
    
    init() {
        disposeBag = DisposeBag()
    }
}

extension QRScannerTabViewModel {
    var qrContentValue: Observable<String?> {
        return qrContent.asObservable()
    }
}

extension QRScannerTabViewModel: QRCodeReaderViewControllerDelegate {
    //  Just for debugging in the simulator
    func testPseudoQRCode() {
        self.qrContent.value = "123456789"
    }
    
    //  Scanner has read QR-code
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        self.qrContent.value = result.value
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        print(#function)
    }
    
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        print(#function)
    }
}
