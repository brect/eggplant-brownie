//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Lima on 21/02/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let mController: UIViewController
    
    init(controller: UIViewController) {
        self.mController = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,  handler: handler)
        alerta.addAction(botaoRemover)
        
        mController.present(alerta, animated: true, completion: nil)
         
    }
}
