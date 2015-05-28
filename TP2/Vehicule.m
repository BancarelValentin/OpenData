//
//  Vehicule.m
//  TP2
//
//  Created by Valentin Bancarel on 21/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import "Vehicule.h"

@implementation Vehicule

-(id)initFromDictionnary:(NSDictionary *)data{
    self = [super init];
    if (self){
        
        if(data[@"Carrosserie"]== [NSNull null]){
            self.Carrosserie = @"";
        }else{
            self.Carrosserie = data[@"Carrosserie"];
        }
            
        if(data[@"champ_v9"] == [NSNull null]){
            self.champ_v9 = @"";
        }else{
            self.champ_v9 = data[@"champ_v9"];
        }
            
        if(data[@"cnit"] == [NSNull null]){
            self.cnit = @"";
        }else{
            self.cnit = data[@"cnit"];
        }
            
        if(data[@"co2"] == [NSNull null]){
            self.co2 = 0;
        }else{
            self.co2 = [data[@"co2"]intValue];
        }
            
        if(data[@"co_typ_1"] == [NSNull null]){
            self.co_typ_1 =  0;
        }else{
            self.co_typ_1 = [data[@"co_typ_1"]intValue];
        }
            
        if(data[@"cod_cbr"] == [NSNull null]){
            self.cod_cbr = @"";
        }else{
            self.cod_cbr = data[@"cod_cbr"];
        }
            
        if(data[@"conso_exurb"] == [NSNull null]){
            self.conso_exurb =  0;
        }else{
            self.conso_exurb = [data[@"conso_exurb"]intValue];
        }
            
        if(data[@"conso_mixte"] == [NSNull null]){
            self.conso_mixte =  0;
        }else{
            self.conso_mixte = [data[@"conso_mixte"]intValue];
        }
            
        if(data[@"conso_urb"] == [NSNull null]){
            self.conso_urb =  0;
        }else{
            self.conso_urb = [data[@"conso_urb"]intValue];
        }
            
        if(data[@"date_maj"] == [NSNull null]){
            self.date_maj = @"";
        }else{
            self.date_maj = data[@"date_maj"];
        }
            
        if(data[@"dscom"] == [NSNull null]){
            self.dscom = @"";
        }else{
            self.dscom = data[@"dscom"];
        }
            
        if(data[@"gamme"] == [NSNull null]){
            self.gamme = @"";
        }else{
            self.gamme = data[@"gamme"];
        }
            
        if(data[@"hc"] == [NSNull null]){
            self.hc =  0;
        }else{
            self.hc = [data[@"hc"]intValue];
        }
            
        if(data[@"hcnox"] == [NSNull null]){
            self.hcnox =  0;
        }else{
            self.hcnox = [data[@"hcnox"]intValue];
        }
            
        if(data[@"hybride"] == [NSNull null]){
            self.hybride = @"";
        }else{
            self.hybride = data[@"hybride"];
        }
            
        if(data[@"lib_mod"] == [NSNull null]){
            self.lib_mod = @"";
        }else{
            self.lib_mod = data[@"lib_mod"];
        }
            
        if(data[@"lib_mod_doss"] == [NSNull null]){
            self.lib_mod_doss = @"";
        }else{
            self.lib_mod_doss = data[@"lib_mod_doss"];
        }
            
        if(data[@"lib_mrq"] == [NSNull null]){
            self.lib_mrq = @"";
        }else{
            self.lib_mrq = data[@"lib_mrq"];
        }
            
        if(data[@"masse_ordma_max"] == [NSNull null]){
            self.masse_ordma_max =  0;
        }else{
            self.masse_ordma_max = [data[@"masse_ordma_max"]intValue];
        }
            
        if(data[@"masse_ordma_min"] == [NSNull null]){
            self.masse_ordma_min =  0;
        }else{
            self.masse_ordma_min = [data[@"masse_ordma_min"]intValue];
        }
            
        if(data[@"nox"] == [NSNull null]){
            self.nox =  0;
        }else{
            self.nox = [data[@"nox"]intValue];
        }
            
        if(data[@"ptcl"] == [NSNull null]){
            self.ptcl =  0;
        }else{
            self.ptcl = [data[@"ptcl"]intValue];
        }
            
        if(data[@"puiss_admin_98"] == [NSNull null]){
            self.puiss_admin_98 = 0;
        }else{
            self.puiss_admin_98 = [data[@"puiss_admin_98"]intValue];
        }
            
        if(data[@"puiss_max"] == [NSNull null]){
            self.puiss_max = 0;
        }else{
            self.puiss_max = [data[@"puiss_max"]intValue];
        }
            
        if(data[@"tvv"] == [NSNull null]){
            self.tvv = @"";
        }else{
            self.tvv = data[@"tvv"];
        }
            
        if(data[@"typ_boite_nb_rapp"] == [NSNull null]){
            self.typ_boite_nb_rapp = @"";
        }else{
            self.typ_boite_nb_rapp = data[@"typ_boite_nb_rapp"];
        }
        
        for (NSString* attr in data) {
            NSLog(@"%@ = %@",attr, data[attr]);
        }
        
    }
    return self;
}
@end
