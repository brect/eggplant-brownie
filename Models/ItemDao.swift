//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Bruno Lima on 21/02/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

class ItemDAO {
    
    func save(_ itens: [Item]){
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
             guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item] {
        do {
            guard let diretorio = ItemDAO().recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let resource = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let path = resource.appendingPathComponent("itens")
        return path
    }
}
