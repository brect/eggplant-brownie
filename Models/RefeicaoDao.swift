//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by Bruno Lima on 21/02/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import Foundation

class RefeicaoDAO {
    
    func save(_ refeicoes: [Refeicao]){
        guard let resource = recuperaDiretorio() else { return }
        
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: resource)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let resource = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        let path = resource.appendingPathComponent("refeicao")
        return path
    }
    
    func recupera() -> [Refeicao] {
        do {
            guard let diretorio = RefeicaoDAO().recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Refeicao]
            
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
