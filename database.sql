CREATE DATABASE ctedata

USE ctedata

CREATE TABLE Athletes (
    Registration                    VARCHAR()       NOT NULL, --UTILIZAR IDENTITY? PERGUNTAR PRO DANIEL SOBRE GERACAO DE MATRICULAS --TAMANHO FIXO?
    Fullname                        VARCHAR(200)    NOT NULL,
    Birthdate                       DATE            NOT NULL,
    Rg                              CHAR(8)         NOT NULL,
    RgExpeditionDate                DATE            NOT NULL,
    RgExpeditionAgency              VARCHAR(20)     NOT NULL,
    Cpf                             CHAR(11)        NOT NULL,
    Gender                          CHAR(1)         NOT NULL,
    Email                           VARCHAR(100)    NOT NULL,
    MaritalStatus                   VARCHAR(10)     NOT NULL,
    FstGuardian                     VARCHAR(200)    NOT NULL,
    SndGuardian                     VARCHAR(200)    NOT NULL,
    -- Category                        VARCHAR()       NOT NULL, --isso aqui nem sei o que é
    Coach                           VARCHAR(200)    NOT NULL, --já entra com treinador?
    CteStartDate                    DATE            NOT NULL,
    CteEndDate                      DATE,   --isso é isso mesmo? a data que ele deixa o cte?


    Federation                      VARCHAR()
    FederationNumber
    Confederation
    ConfederationNumber
    InternationalFederation
    InternationalFederationNumber

    Financier                       VARCHAR(),  --é uma pessoa? uma empresa?
    SightedGuide                    VARCHAR(200), --ou referencia para outro atleta
    FstGuest                        VARCHAR(200),
    SndGuest                        VARCHAR(200),
    UpperLimbsDominance             CHAR(1)         NOT NULL, --BIT? AMBIDESTRO
    LowerLimbsDominance             CHAR(1)         NOT NULL, --BIT?
    BloodType                       VARCHAR(3)      NOT NULL,
    MeanOfTransportation            VARCHAR(100),
    FinancialSupport                BIT             NOT NULL,
    -- placa ou linha?
    NumberOfCars                    TINYINT,
    NumberOfServants                TINYINT,
    NumberOfWashingMachines         TINYINT,
    NumberOfBathrooms               TINYINT,
    NumberOfDvdPlayers              TINYINT,
    NumberOfRefrigerators           TINYINT,
    NumberOfFreezers                TINYINT,
    NumberOfPcs                     TINYINT,
    NumberOfDishwashers             TINYINT,
    NumberOfMicrowaveOvens          TINYINT,
    NumberOfMotorcycles             TINYINT,
    NumberOfClothesDryers           TINYINT,
    StreetType                      VARCHAR(), --?????????????
    WaterSupply                     VARCHAR(), --??????????
    FamilyHead                      VARCHAR(15),
    FamilyHeadsLevelOfEducation     VARCHAR(20),
    Alergies                        BIT             NOT NULL,
    AlergiesDescription             VARCHAR(100),
    Cep                             CHAR(8)         NOT NULL,
    "Number"                        VARCHAR(15)     NOT NULL,
    District                        VARCHAR(100)    NOT NULL,
    AdressDetails                   VARCHAR(50),
    City                            VARCHAR(30)     NOT NULL,
    StreetName                      VARCHAR(100)    NOT NULL,
    "State"                         CHAR(2)         NOT NULL,
    PrescriptionDrugs               BIT             NOT NULL,
    PrescriptionDrugsDescription    VARCHAR(150),

    PRIMARY KEY (Registration)
);

CREATE TABLE PhoneNumbers (
    Athlete                         VARCHAR()       NOT NULL, --decidir tamanho da matricula
    "Number"                        VARCHAR(15)     NOT NULL,
    "Type"                          VARCHAR(15)     NOT NULL,

    PRIMARY KEY(Athlete,"Number"),
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE EmergencyContacts (
    Athlete                         VARCHAR()       NOT NULL,
    "Number"                        VARCHAR(15)     NOT NULL,
    "Name"                          VARCHAR(100)    NOT NULL,
    Connection                      VARCHAR(50)     NOT NULL,

    PRIMARY KEY(Athlete,"Number"),
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE AthleteFederations (
    Athlete                         VARCHAR()       NOT NULL,
    
);

CREATE TABLE AthleteConfederations (

);

CREATE TABLE InternationalFederationAthlete (

);

CREATE TABLE 