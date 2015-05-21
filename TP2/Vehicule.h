//
//  Vehicule.h
//  TP2
//
//  Created by Valentin Bancarel on 21/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicule : NSObject


///la marque
@property NSString* lib_mrq;

///le modele du dossier
@property NSString* lib_mod_doss;

///le modèle commercial
@property NSString* lib_mod;

///la désignation commerciale
@property NSString* dscom;

///le Code National d'Identification du Type (CNIT)
@property NSString* cnit;

///le Type-Variante-Version (TVV) ou le type Mines
@property NSString* tvv;

///le type de carburant
@property NSString* cod_cbr;

///une information permettant d’identifier les véhicules hybrides (O/N)
@property NSString* hybride;

///la puissance administrative
@property int puiss_admin_98;

///la puissance maximale (en kW)
@property int puiss_max;

///le type de boîte de vitesse et le nombre de rapports,
@property NSString* typ_boite_nb_rapp;

///consommation urbaine de carburant (en l/100km)
@property int conso_urb;

///consommation mixte de carburant (en l/100km),
@property int conso_exurb;

///consommation extra urbaine de carburant (en l/100km),
@property int conso_mixte;

///l'émission de CO2 (en g/km),
@property int co2;

///le résultat d’essai de CO type I
@property int co_typ_1;

///les résultats d’essai HC
@property int hc;

///les résultats d’essai NOx
@property int nox;

///les résultats d’essai HC+NOX
@property int hcnox;

///le résultat d’essai de particules
@property int ptcl;

///la masse en ordre de marche mini
@property int masse_ordma_min;

///la masse en ordre de marche maxi
@property int masse_ordma_max;

///le champ V9 du certificat d’immatriculation qui contient la norme EURO
@property NSString* champ_v9;

///la date de la dernière mise à jour.
@property NSString* date_maj;

///Carrosserie
@property NSString* Carrosserie;

///gamme
@property NSString* gamme;

-(id)initFromDictionnary:(NSDictionary*)data;


@end
