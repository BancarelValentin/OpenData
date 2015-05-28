//
//  TP2Tests.m
//  TP2Tests
//
//  Created by Valentin Bancarel on 21/05/2015.
//  Copyright (c) 2015 bancarelvalentin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Vehicule.h"

@interface TP2Tests : XCTestCase

@property NSDictionary *wellFormattedDict;
@property NSDictionary *dictWithNilForString;
@property NSDictionary *dictWithNSNullForString;
@property NSDictionary *dictWithNilForInteger;
@property NSDictionary *dictWithNSNullForInteger;
@property NSDictionary *dictWithEmptyString;
@property NSDictionary *dictWithEmptyInteger;
@property NSDictionary *dictWithMissingAttributes;

@end

@implementation TP2Tests


- (void)setUp {
    [super setUp];
    
    self.wellFormattedDict = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"BERLINE",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              @"12" ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithNilForString = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              nil,@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              @"12" ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithNSNullForString = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              [NSNull null],@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              @"12" ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithNilForInteger = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"BERLINE",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                             nil,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithNSNullForInteger = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"BERLINE",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              [NSNull null] ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithEmptyString = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              @"12" ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithEmptyInteger = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"BERLINE",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"4,199999809",@"conso_exurb",
                              @"5,099999905",@"conso_mixte",
                              @"6,599999905",@"conso_urb",
                              @"mars-14",@"date_maj",
                              @"159 2.0 JTDm (136ch)",@"dscom",
                              @"MOY-SUPER",@"gamme",
                              @"" ,@"hc",
                              @"0,174999997",@"hcnox",
                              @"non",@"hybride",
                              @"159",@"lib_mod",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
    
    self.dictWithMissingAttributes = [[NSDictionary alloc]initWithObjectsAndKeys:@"value",@"key",
                              @"BERLINE",@"Carrosserie",
                              @"715/2007*692/2008EURO5",@"champ_v9",
                              @"M10ALFVP000E302",@"cnit",
                              @"134",@"co2",
                              @"0,066",@"co_typ_1",
                              @"GO",@"cod_cbr",
                              @"159",@"lib_mod_doss",
                              @"ALFA-ROMEO",@"lib_mrq",
                              @"1565",@"masse_ordma_max",
                              @"1565",@"masse_ordma_min",
                              @"0,149000004",@"nox",
                              @"0,001",@"ptcl",
                              @"7",@"puiss_admin_98",
                              @"100",@"puiss_max",
                              @"939AXR1B64",@"tvv",
                              @"M 6",@"typ_boite_nb_rapp", nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitVehiculesWithWellFormattedDict{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.wellFormattedDict];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithEmptyInteger{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithEmptyInteger];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithEmptyString{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithEmptyString];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithNilForInteger{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithNilForInteger];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithNilForString{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithNilForString];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithMissingAttributes{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithMissingAttributes];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithNSNullForString{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithNSNullForString];
    XCTAssertNotNil (v);
}

- (void)testInitVehiculesWithDictWithNSNullForInteger{
    Vehicule *v = [[Vehicule alloc]initFromDictionnary:self.dictWithNSNullForInteger];
    XCTAssertNotNil (v);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
