//
//  CFETableViewController.swift
//  Gastaldi
//
//  Created by Daniel Bonini on 6/11/16.
//  Copyright © 2016 Daniel Bonini. All rights reserved.
//

import UIKit
import CFE
import CoreData

class CFETableViewController: CoreDataTableViewController {

    var managedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let context = managedObjectContext {
            let request = NSFetchRequest<Certificado>(entityName: "Certificado")
            request.sortDescriptors = [NSSortDescriptor(key: "anioMesCargo", ascending: false), NSSortDescriptor(key: "fechaCFE", ascending: false)]
            fetchedResultsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: "anioMesCargo",
                cacheName: nil)
            
            createCFEFromURL("https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.54,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=")
        } else {
            fetchedResultsController = nil
        }
    }
    
    fileprivate struct Storyboard {
        static let CFECellIdentifier = "CertificadoFiscal"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CFECellIdentifier, for: indexPath)

        if let cfe = fetchedResultsController?.object(at: indexPath) {
            if let cfeCell = cell as? CFETableViewCell {
                cfeCell.certificado = cfe
            }            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let title = sectionName(for: section) {
            if let fecha = Date(fromString: title, format: .custom("yyyyMM")) {
                return fecha.toString(style: .month) + " \(fecha.component(.year)!)"
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    // Sample URL: https://www.efactura.dgi.gub.uy/consultaQR/cfe?210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    // Sample Query: 210003270017,101,CZ,0138959,347.52,20160508,/tml+akY4tv6Nx1Ryvpr7JcSdnw=
    @IBAction func addCFE(_ segue: UIStoryboardSegue) {
        let urlText = (segue.source.contentViewController as? CFECaptureViewController)?.messageMetaData
        createCFEFromURL(urlText)
    }
    
    fileprivate func createCFEFromURL(_ url: String?) {
        if url != nil {
            if let metaDataArray = parseURL(url!) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyyMMdd"
                let fecha = dateFormatter.date(from: metaDataArray[5])
                
                let cfe = CFE.Certificado(tipoComprobante: Int(metaDataArray[1])!,
                                          fechaComprobante: fecha!,
                                          fechaCarga: Date(),
                                          monto: Double(metaDataArray[4])!,
                                          numeroComprobante: Int(metaDataArray[3])!,
                                          serieComprobante: metaDataArray[2],
                                          urlCFE: url!,
                                          codigoSeg: metaDataArray[6])
                
                cfe.emisor.ruc = Int(metaDataArray[0])!

                if let _ = Certificado.certificadoConCertInfo(cfe, inManagedObjectContext: managedObjectContext!) {
                    _ = try? managedObjectContext?.save()
                }
            }
        }
    }
}

private func parseURL(_ url: String) -> [String]? {
    return url.characters.split(separator: "?").map(String.init).last?.characters.split(separator: ",").map(String.init)
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? navcon
        } else {
            return self
        }
    }
}

extension NSNumber {
    func string(with style: NumberFormatter.Style) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = style
        
        return formatter.string(from: self)
    }
}
