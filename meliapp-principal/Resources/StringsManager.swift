//
//  StringsManager.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 18/10/23.
//

import Foundation

struct StringsManager {
    struct GeneralStrings {
        static let emptySpace = " "
        static let notSpace = ""
        static let urlMain = "https://api.mercadolibre.com"
        static let error = "Error"
    }
    
    struct Endpoints {
        static let searchArticles = "/sites/MCO/search?q="
        static let detailArticles = "/items/"
    }
    
    struct RouterStrings {
        static let listResultViewController = "ListResultViewController"
        static let listResultViewControllerDetail = "DetailArticleViewController"
    }
    
    struct TableViewCellStrings {
        static let identifier = "articleCell"
        static let nibName = "ListResultTableViewCell"
        static let systemName = "rectangle.inset.filled.and.person.filled"
    }
    
    struct ViewControllerString {
        static let searchTextField = "Buscar en Mercado Libre"
        static let conditionNew = "Nuevo"
        static let conditionUsed = "Usado"
        static let accept = "Aceptar"
        static let cancel = "Cancelar"
        static let systemNameDetail = "rectangle.inset.filled.and.person.filled"
    }
    
    struct InteractorStrings {
        static let httpMethod = "GET"
    }
    
    struct PresenterStrings {
        static let freeShipping =  "Envío gratis"
        static let welcomeText = "Mercado Libre"
        static let noResults = "No hay registros"
        static let officialStoreName = "por Apple"
        static let errorMessage = "Tenemos Problemas, intentelo mas tarde"
        static let maximumInstallments = "Hasta 48 Cuotas"
        static let errorConection = "Tenemos Problemas de conexion \nintenta nuevamente"
    }
}
