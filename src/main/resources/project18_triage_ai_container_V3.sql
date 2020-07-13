create schema triage;
create table entry
(
    idAccept_DGPR int unsigned auto_increment
        primary key,
    accept_DGPR   tinyint(1) null
);

create table patient
(
    idPatient     int unsigned auto_increment
        primary key,
    idAccept_DGPR int unsigned null,
    constraint patient_ibfk_1
        foreign key (idAccept_DGPR) references entry (idAccept_DGPR)
);

create table height
(
    idHeight  int unsigned auto_increment
        primary key,
    height    int unsigned null,
    idPatient int unsigned null,
    constraint height_ibfk_1
        foreign key (idPatient) references patient (idPatient)
);

create index idPatient
    on height (idPatient);

create index idAccept_DGPR
    on patient (idAccept_DGPR);

create table personal_data
(
    idPersonal_data              int unsigned auto_increment
        primary key,
    personal_identification_code mediumtext   null,
    first_name                   varchar(25)  not null,
    last_name                    varchar(25)  not null,
    place_of_birth               varchar(25)  not null,
    date_of_birth                date         null,
    current_address              varchar(35)  not null,
    validityId                   tinyint(1)   null,
    insurance_code               mediumtext   null,
    idPatient                    int unsigned null,
    constraint personal_data_ibfk_1
        foreign key (idPatient) references patient (idPatient)
);

create index idPatient
    on personal_data (idPatient);

create table temperature
(
    idTemperature           int unsigned auto_increment
        primary key,
    entry_temperature_check float unsigned null,
    half_temperature_check  float unsigned null,
    final_temperature_check float unsigned null,
    idPatient               int unsigned   null,
    constraint temperature_ibfk_1
        foreign key (idPatient) references patient (idPatient)
);

create index idPatient
    on temperature (idPatient);

create table weight
(
    idWeight      int unsigned auto_increment
        primary key,
    patientWeight int unsigned null,
    idPatient     int unsigned null,
    constraint weight_ibfk_1
        foreign key (idPatient) references patient (idPatient)
);

create table risk_level
(
    idRisk          int unsigned auto_increment
        primary key,
    riskValue       int unsigned null,
    idHeight        int unsigned null,
    idWeight        int unsigned null,
    idTemperature   int unsigned null,
    idPersonal_data int unsigned null,
    idPatient       int unsigned null,
    constraint risk_level_ibfk_1
        foreign key (idHeight) references height (idHeight),
    constraint risk_level_ibfk_2
        foreign key (idWeight) references weight (idWeight),
    constraint risk_level_ibfk_3
        foreign key (idTemperature) references temperature (idTemperature),
    constraint risk_level_ibfk_4
        foreign key (idPersonal_data) references personal_data (idPersonal_data),
    constraint risk_level_ibfk_5
        foreign key (idPatient) references patient (idPatient)
);

create table audio_video_dgpr
(
    idAudioVideo_accept_DGPR int unsigned auto_increment
        primary key,
    AudioVideo_accept_DGPR   tinyint(1)   null,
    idRisk                   int unsigned null,
    idPatient                int unsigned null,
    constraint audio_video_dgpr_ibfk_1
        foreign key (idRisk) references risk_level (idRisk),
    constraint audio_video_dgpr_ibfk_2
        foreign key (idPatient) references patient (idPatient)
);

create index idPatient
    on audio_video_dgpr (idPatient);

create index idRisk
    on audio_video_dgpr (idRisk);

create table blood_pressure_ekg
(
    idBlood_presure_EKG int unsigned auto_increment
        primary key,
    testPressure        int unsigned null,
    testEKG             int unsigned null,
    idPatient           int unsigned null,
    constraint blood_pressure_ekg_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on blood_pressure_ekg (idPatient);

create table eeg
(
    idEEG     int unsigned auto_increment
        primary key,
    testEEG   int unsigned null,
    testExtra int unsigned null,
    idPatient int unsigned null,
    constraint eeg_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on eeg (idPatient);

create table glycemic
(
    idGlycemic     int unsigned auto_increment
        primary key,
    testGlycemic   int unsigned null,
    reTestGlycemic int unsigned null,
    idPatient      int unsigned null,
    constraint glycemic_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on glycemic (idPatient);

create table illnesses
(
    idIllness   int unsigned auto_increment
        primary key,
    nameIllness varchar(30)  not null,
    idPatient   int unsigned null,
    constraint illnesses_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on illnesses (idPatient);

create table kawasaki
(
    idKawasaki   int unsigned auto_increment
        primary key,
    testKawasaki int unsigned null,
    testOptional int unsigned null,
    idPatient    int unsigned null,
    constraint kawasaki_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on kawasaki (idPatient);

create table laryngoscopy
(
    idLaryngoscopy     int unsigned auto_increment
        primary key,
    video_laryngoscopy int unsigned null,
    testLaryngoscopy   int unsigned null,
    idPatient          int unsigned null,
    constraint laryngoscopy_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on laryngoscopy (idPatient);

create table long_distance_care
(
    idLong_distance_care int unsigned auto_increment
        primary key,
    test1                int unsigned null,
    test2                int unsigned null,
    test3                int unsigned null,
    idPatient            int unsigned null,
    constraint long_distance_care_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on long_distance_care (idPatient);

create table pulse
(
    idPulse   int unsigned auto_increment
        primary key,
    frequency int unsigned null,
    oximetry  int unsigned null,
    testPulse int unsigned null,
    idPatient int unsigned null,
    constraint pulse_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on pulse (idPatient);

create table respiratory
(
    idRespiratory  int unsigned auto_increment
        primary key,
    frequency      int unsigned null,
    aplitude       int unsigned null,
    testRespratory int unsigned null,
    idPatient      int unsigned null,
    constraint respiratory_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on respiratory (idPatient);

create index idHeight
    on risk_level (idHeight);

create index idPatient
    on risk_level (idPatient);

create index idPersonal_data
    on risk_level (idPersonal_data);

create index idTemperature
    on risk_level (idTemperature);

create index idWeight
    on risk_level (idWeight);

create table spirometry
(
    idSpirometry    int unsigned auto_increment
        primary key,
    testStethoscope int unsigned null,
    testSpirometry  int unsigned null,
    digitalRX       int unsigned null,
    idPatient       int unsigned null,
    constraint spirometry_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create index idPatient
    on spirometry (idPatient);

create table treatments
(
    idTreatments  int unsigned auto_increment
        primary key,
    nameTreatment varchar(30)  not null,
    idPatient     int unsigned null,
    constraint treatments_ibfk_1
        foreign key (idPatient) references audio_video_dgpr (idPatient)
);

create table clinical_outcome
(
    idReciep             int auto_increment
        primary key,
    verdict              tinyint(1)   null,
    print                tinyint(1)   null,
    idIllness            int unsigned null,
    idTreatments         int unsigned null,
    idRespiratory        int unsigned null,
    idPulse              int unsigned null,
    idGlycemic           int unsigned null,
    idBlood_presure_EKG  int unsigned null,
    idSpirometry         int unsigned null,
    idLaryngoscopy       int unsigned null,
    idEEG                int unsigned null,
    idKawasaki           int unsigned null,
    idLong_distance_care int unsigned null,
    idPatient            int unsigned null,
    constraint clinical_outcome_ibfk_1
        foreign key (idIllness) references illnesses (idIllness),
    constraint clinical_outcome_ibfk_10
        foreign key (idKawasaki) references kawasaki (idKawasaki),
    constraint clinical_outcome_ibfk_11
        foreign key (idLong_distance_care) references long_distance_care (idLong_distance_care),
    constraint clinical_outcome_ibfk_12
        foreign key (idPatient) references audio_video_dgpr (idPatient),
    constraint clinical_outcome_ibfk_2
        foreign key (idTreatments) references treatments (idTreatments),
    constraint clinical_outcome_ibfk_3
        foreign key (idRespiratory) references respiratory (idRespiratory),
    constraint clinical_outcome_ibfk_4
        foreign key (idPulse) references pulse (idPulse),
    constraint clinical_outcome_ibfk_5
        foreign key (idGlycemic) references glycemic (idGlycemic),
    constraint clinical_outcome_ibfk_6
        foreign key (idBlood_presure_EKG) references blood_pressure_ekg (idBlood_presure_EKG),
    constraint clinical_outcome_ibfk_7
        foreign key (idSpirometry) references spirometry (idSpirometry),
    constraint clinical_outcome_ibfk_8
        foreign key (idLaryngoscopy) references laryngoscopy (idLaryngoscopy),
    constraint clinical_outcome_ibfk_9
        foreign key (idEEG) references eeg (idEEG)
);

create index idBlood_presure_EKG
    on clinical_outcome (idBlood_presure_EKG);

create index idEEG
    on clinical_outcome (idEEG);

create index idGlycemic
    on clinical_outcome (idGlycemic);

create index idIllness
    on clinical_outcome (idIllness);

create index idKawasaki
    on clinical_outcome (idKawasaki);

create index idLaryngoscopy
    on clinical_outcome (idLaryngoscopy);

create index idLong_distance_care
    on clinical_outcome (idLong_distance_care);

create index idPatient
    on clinical_outcome (idPatient);

create index idPulse
    on clinical_outcome (idPulse);

create index idRespiratory
    on clinical_outcome (idRespiratory);

create index idSpirometry
    on clinical_outcome (idSpirometry);

create index idTreatments
    on clinical_outcome (idTreatments);

create index idPatient
    on treatments (idPatient);

create index idPatient
    on weight (idPatient);

