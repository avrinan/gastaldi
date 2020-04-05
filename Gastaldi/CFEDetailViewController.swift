//
//  MyUIViewController.swift
//  Tablas
//
//  Created by Daniel Bonini on 6/29/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit
import CFE
import CoreData

class CFEDetailViewController: UIViewController {

    
    @IBOutlet weak var qrMetadataView: UITextView!
    
    fileprivate var url: URLComponents?
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
    
    var QRMetaData : String = "" {
        didSet {
            print("QRMetaData = \(QRMetaData)")
            url = URLComponents(string: QRMetaData)
        }
    }
    
    // Sample URL: https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    // Sample Query: 210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    @IBAction func addCFE(_ sender: AnyObject) {
        if let metaDataArray = self.url?.query?.characters.split(separator: ",").map(String.init) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyyMMdd"
            let fecha = dateFormatter.date(from: metaDataArray[5])
            
            let cfe = CFE.Certificado(tipoComprobante: Int(metaDataArray[1])!,
                                      fechaComprobante: fecha!,
                                      fechaCarga: Date(),
                                      monto: Double(metaDataArray[4])!,
                                      numeroComprobante: Int(metaDataArray[3])!,
                                      serieComprobante: metaDataArray[2],
                                      urlCFE: QRMetaData,
                                      codigoSeg: metaDataArray[6])
            
            cfe.emisor.ruc = Int(metaDataArray[0])!
            
            if let _ = Certificado.certificadoConCertInfo(cfe, inManagedObjectContext: managedObjectContext!) {
                _ = try? managedObjectContext?.save()
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        qrMetadataView.text = QRMetaData
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        url = nil
        managedObjectContext = nil
    }
}
