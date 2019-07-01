CREATE DATABASE ctedata

USE ctedata

CREATE TABLE IF NOT EXISTS Athletes (
    Registration                    CHAR(10)        NOT NULL,
    Fullname                        VARCHAR(200)    NOT NULL,
    Birthdate                       DATE            NOT NULL,
    Rg                              CHAR(8)         NOT NULL,
    RgExpeditionDate                DATE            NOT NULL,
    RgExpeditionAgency              VARCHAR(20)     NOT NULL,
    Cpf                             CHAR(11)        NOT NULL,
    Gender                          CHAR(1)         NOT NULL,
    Email                           VARCHAR(100)    NOT NULL,
    MaritalStatus                   VARCHAR(10)     NOT NULL,
    CteStartDate                    DATE            NOT NULL,
    CteEndDate                      DATE,
    Category                        VARCHAR(50)     NOT NULL, -- to do
    UpperLimbsDominance             CHAR(1)         NOT NULL,
    LowerLimbsDominance             CHAR(1)         NOT NULL,
    BloodType                       VARCHAR(3)      NOT NULL,
    MeanOfTransportation            VARCHAR(100),
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
    StreetType                      VARCHAR(50),
    WaterSupply                     VARCHAR(50),
    FamilyHead                      VARCHAR(15),
    FamilyHeadsLevelOfEducation     VARCHAR(20),
    Coach                           VARCHAR(200)    NOT NULL,
    Federation                      VARCHAR(100),
    Confederation                   VARCHAR(100),
    InternationalFederation         VARCHAR(100),
    SightedGuide                    VARCHAR(200),
    CarPlateOrBusLine               VARCHAR(8),
    FstGuardian                     VARCHAR(200)    NOT NULL,
    SndGuardian                     VARCHAR(200)    NOT NULL,
    Financier                       VARCHAR(200),
    FstGuest                        VARCHAR(200),
    SndGuest                        VARCHAR(200),
    FinancialSupport                BIT             NOT NULL,
    FederationNumber                VARCHAR(100),
    ConfederationNumber             VARCHAR(100),
    InternationalFederationNumber   VARCHAR(100),
    PRIMARY KEY (Registration),
    FOREIGN KEY Federation REFERENCES Federations("Name") ON UPDATE CASCADE
    FOREIGN KEY Confederation REFERENCES Confederations("Name") ON UPDATE CASCADE
    FOREIGN KEY InternationalFederation REFERENCES InternationalFederations("Name") ON UPDATE CASCADE
    FOREIGN KEY FstGuardian REFERENCES Guardians(Fullname) ON UPDATE CASCADE
    FOREIGN KEY SndGuardian REFERENCES Guardians(Fullname) ON UPDATE CASCADE
    FOREIGN KEY Financier REFERENCES Financier(Fullname) ON UPDATE CASCADE
    FOREIGN KEY Coach REFERENCES Coaches(Fullname) ON UPDATE CASCADE
    FOREIGN KEY FstGuest REFERENCES Guests(Rg) ON UPDATE CASCADE
    FOREIGN KEY SndGuest REFERENCES Guests(Rg) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PhoneNumbers (
    Athlete                         VARCHAR(10)     NOT NULL,
    "Number"                        VARCHAR(15)     NOT NULL,
    "Type"                          VARCHAR(15)     NOT NULL,
    PRIMARY KEY(Athlete,"Number"),
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS EmergencyContacts (
    Athlete                         VARCHAR(10)     NOT NULL,
    "Number"                        VARCHAR(15)     NOT NULL,
    "Name"                          VARCHAR(100)    NOT NULL,
    Connection                      VARCHAR(50)     NOT NULL,
    PRIMARY KEY(Athlete,"Number"),
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Federations (
    "Name"                          VARCHAR(100)    NOT NULL,
    PRIMARY KEY("Name")
);

CREATE TABLE IF NOT EXISTS Confederations (
    "Name"                          VARCHAR(100)    NOT NULL,
    PRIMARY KEY("Name")
);

CREATE TABLE IF NOT EXISTS InternationalFederations (
    "Name"                          VARCHAR(100)    NOT NULL,
    PRIMARY KEY("Name")
);

CREATE TABLE IF NOT EXISTS Modalities (
    "Name"                          VARCHAR(50)      NOT NULL,
    PRIMARY KEY("Name")
);

CREATE TABLE IF NOT EXISTS Events (
    "Name"                          VARCHAR(100)     NOT NULL,
    Modality                        VARCHAR(50)      NOT NULL,
    PRIMARY KEY("Name", Modality),
    FOREIGN KEY (Modality) REFERENCES Modalities("Name") ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS MainEvents (
    Athlete                         VARCHAR(10)      NOT NULL,
    "Name"                          VARCHAR(100)     NOT NULL,
    Modality                        VARCHAR(50)      NOT NULL,
    PRIMARY KEY (Athlete, "Name", Modality),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON UPDATE CASCADE ON DELETE CASCADE
    FOREIGN KEY ("Name", Modality) REFERENCES Events("Name", ModalitY) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS AthleteModalities (
    Modality                        VARCHAR(50)      NOT NULL,
    Athlete                         VARCHAR(10)      NOT NULL,
    "Date"                          DATE             NOT NULL,
    PRIMARY KEY(Modality, Athlete),
    FOREIGN KEY (Modality) REFERENCES Modalities("Name") ON UPDATE CASCADE,
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS HealthInsurance (
    Athlete                         VARCHAR(10)     NOT NULL,
    Carrier                         VARCHAR(50)     NOT NULL,
    "Number"                        VARCHAR(100)    NOT NULL UNIQUE,
    PRIMARY KEY (Athlete, Carrier),
    FOREIGN KEY (Athlete) REFERENCES Athletes(Registration) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Guardians (
    Fullname                        VARCHAR(200)    NOT NULL,
    PRIMARY KEY (Fullname)
);

CREATE TABLE IF NOT EXISTS Financier (
    Fullname                        VARCHAR(200     NOT NULL,
    PRIMARY KEY (Fullname)
);

CREATE TABLE IF NOT EXISTS Coaches (
    Fullname                        VARCHAR(200)    NOT NULL,
    Cref                            VARCHAR(100)    NOT NULL,
    PRIMARY KEY (Fullname, Cref)
);

CREATE TABLE IF NOT EXISTS Guests (
    Rg                              CHAR(10)        NOT NULL,
    Fullname                        VARCHAR(200)    NOT NULL,
    PhoneNumber                     VARCHAR(20)     NOT NULL,
    PRIMARY KEY (Rg)
);

CREATE TABLE IF NOT EXISTS Weights (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Heights (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SittingHeights (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Wingspans (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS RightLowerLimbLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTTS LeftLowerLimbLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS RightUpperLimbLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS LeftUpperLimbLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS FootLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS HandLenghts (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Tests (
    "Name"                          CHAR(100)       NOT NULL,
    PRIMARY KEY ("Name")
);

CREATE TABLE IF NOT EXISTS FrontalPlank (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Time                            TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MedicineBallThrow (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Measure                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS FiveKilogramsThrow (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    FstMeasure                      FLOAT           NOT NULL,
    SndMeasure                      FLOAT           NOT NULL,
    TrdMeasure                      FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS FortyMeters (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    FstMeasure                      TIMESTAMP       NOT NULL,
    SndMeasure                      TIMESTAMP       NOT NULL,
    TrdMeasure                      TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ThreeHundredMeters (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    FstMeasure                      TIMESTAMP       NOT NULL,
    SndMeasure                      TIMESTAMP       NOT NULL,
    TrdMeasure                      TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TwoThousandMeters (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    FstMeasure                      TIMESTAMP       NOT NULL,
    SndMeasure                      TIMESTAMP       NOT NULL,
    TrdMeasure                      TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Throws (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    "Type"                          VARCHAR(35)     NOT NULL,
    FstMeasure                      TIMESTAMP       NOT NULL,
    SndMeasure                      TIMESTAMP       NOT NULL,
    TrdMeasure                      TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TripleJumps (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    "Type"                          VARCHAR(35)     NOT NULL,
    FstMeasure                      TIMESTAMP       NOT NULL,
    SndMeasure                      TIMESTAMP       NOT NULL,
    TrdMeasure                      TIMESTAMP       NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Wingates (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Limb                            CHAR(1)         NOT NULL,
    "Power"                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS OneRepetitionMaximum (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Exercise                        CHAR(20)        NOT NULL,
    Machine                         CHAR(20)        NOT NULL,
    AbsoluteValue                   FLOAT           NOT NULL,
    RelativeValue                   FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SeatedJump (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    FstJump                         FLOAT           NOT NULL,
    SndJump                         FLOAT           NOT NULL,
    TrdJump                         FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MaximumVO2 (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    AbsoluteValue                   FLOAT           NOT NULL,
    RelativeValue                   FLOAT           NOT NULL,
    Duration                        TIMESTAMP       NOT NULL,
    Obs                             VARCHAR(200)    NOT NULL,
    "Type"                          VARCHAR(20)     NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DynamicBar (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    NumberOfRepetitions             INT             NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Skinfolds (
    Athlete                         CHAR(10)        NOT NULL,
    "Date"                          DATE            NOT NULL,
    Triceps                         FLOAT           NOT NULL,
    Subscapular                     FLOAT           NOT NULL,
    Biceps                          FLOAT           NOT NULL,
    Breastplate                     FLOAT           NOT NULL,
    Subaxillary                     FLOAT           NOT NULL,
    Suprailiaca                     FLOAT           NOT NULL,
    Abdominal                       FLOAT           NOT NULL,
    Tight                           FLOAT           NOT NULL,
    Calf                            FLOAT           NOT NULL,
    PRIMARY KEY (Athlete, "Date"),
    FOREIGN KEY Athlete REFERENCES Athletes(Registration) ON DELETE CASCADE
);
