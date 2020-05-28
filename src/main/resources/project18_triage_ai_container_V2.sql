create schema triage;
create table triage.entry
(
    idAccept_DGPR int unsigned auto_increment primary key,
    accept_DGPR boolean
);

create table triage.patient
(
    idPatient int unsigned auto_increment primary key,
    idAccept_DGPR int unsigned,
    foreign key (idAccept_DGPR) references triage.entry(idAccept_DGPR)
);

create table triage.weight
(
    idWeight int unsigned auto_increment primary key,
    patientWeight int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.patient(idPatient)
);

create table  triage.height
(
    idHeight int unsigned auto_increment primary key,
    height int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.temperature
(
    idTemperature int unsigned auto_increment primary key,
    entry_temperature_check float unsigned,
    half_temperature_check float unsigned,
    final_temperature_check float unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.personal_data
(
    idPersonal_data int unsigned auto_increment primary key,
    personal_identification_code long,
    first_name varchar (25) not null,
    last_name varchar(25) not null,
    place_of_birth varchar(25) not null,
    date_of_birth date,
    current_address varchar(35) not null,
    validityId boolean,
    insurence_code long,
    idPatient int unsigned,
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.high_risk
(
    idHighRisk int unsigned auto_increment primary key,
    riskValue int unsigned,
    idHeight int unsigned,
    idWeight int unsigned,
    idTemperature int unsigned,
    idPersonal_data int unsigned,
    idPatient int unsigned,
    foreign key (idHeight) references triage.height(idHeight),
    foreign key (idWeight) references triage.weight(idWeight),
    foreign key (idTemperature) references triage.temperature(idTemperature),
    foreign key (idPersonal_data) references triage.personal_data(idPersonal_data),
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.low_risk
(
    idLowRisk int unsigned auto_increment primary key,
    riskValue int unsigned,
    idHeight int unsigned,
    idWeight int unsigned,
    idTemperature int unsigned,
    idPersonal_data int unsigned,
    idPatient int unsigned,
    foreign key (idHeight) references triage.height(idHeight),
    foreign key (idWeight) references triage.weight(idWeight),
    foreign key (idTemperature) references triage.temperature(idTemperature),
    foreign key (idPersonal_data) references triage.personal_data(idPersonal_data),
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.audio_video_DGPR
(
    idAudioVideo_accept_DGPR int unsigned auto_increment primary key,
    AudioVideo_accept_DGPR boolean,
    idHighRisk int unsigned,
    idLowRisk int unsigned,
    idPatient int unsigned,
    foreign key (idHighRisk) references triage.high_risk(idHighRisk),
    foreign key (idLowRisk) references triage.low_risk(idLowRisk),
    foreign key (idPatient) references triage.patient(idPatient)
);

create table triage.illnesses
(
    idIllness int unsigned auto_increment primary key,
    nameIllness varchar(30) not null,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);

create table triage.treatments
(
    idTreatments int unsigned auto_increment primary key,
    nameTreatment varchar(30) not null,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);

create table triage.respiratory
(
    idRespiratory int unsigned auto_increment primary key,
    frequency int unsigned,
    aplitude int unsigned,
    testRespratory int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);

create table triage.pulse
(
    idPulse int unsigned auto_increment primary key,
    frequency int unsigned,
    oximetry int unsigned,
    testPulse int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);

create table triage.glycemic
(
    idGlycemic int unsigned auto_increment primary key,
    testGlycemic int unsigned,
    reTestGlycemic int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.blood_pressure_EKG
(
    idBlood_presure_EKG int unsigned auto_increment primary key,
    testPressure int unsigned,
    testEKG int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.spirometry
(
    idSpirometry int unsigned auto_increment primary key,
    testStethoscope int unsigned,
    testSpirometry int unsigned,
    digitalRX int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create  table triage.laryngoscopy
(
    idLaryngoscopy int unsigned auto_increment primary key,
    video_laryngoscopy int unsigned,
    testLaryngoscopy int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.EEG
(
    idEEG int unsigned auto_increment primary key,
    testEEG int unsigned,
    testExtra int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.kawasaki
(
    idKawasaki int unsigned auto_increment primary key,
    testKawasaki int unsigned,
    testOptional int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.long_distance_care
(
    idLong_distance_care int unsigned auto_increment primary key,
    test1 int unsigned,
    test2 int unsigned,
    test3 int unsigned,
    idPatient int unsigned,
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);
create table triage.clinical_outcome
(
    idReciep int auto_increment primary key,
    verdict boolean,
    print boolean,
    idIllness int unsigned,
    idTreatments int unsigned,
    idRespiratory int unsigned,
    idPulse int unsigned,
    idGlycemic int unsigned,
    idBlood_presure_EKG int unsigned,
    idSpirometry int unsigned,
    idLaryngoscopy int unsigned,
    idEEG int unsigned,
    idKawasaki int unsigned,
    idLong_distance_care int unsigned,
    idPatient int unsigned,
    foreign key (idIllness) references triage.illnesses(idIllness),
    foreign key (idTreatments) references triage.treatments(idTreatments),
    foreign key (idRespiratory) references triage.respiratory(idRespiratory),
    foreign key (idPulse) references triage.pulse(idPulse),
    foreign key (idGlycemic) references triage.glycemic(idGlycemic),
    foreign key (idBlood_presure_EKG) references triage.blood_pressure_EKG(idBlood_presure_EKG),
    foreign key (idSpirometry) references triage.spirometry(idSpirometry),
    foreign key (idLaryngoscopy) references triage.laryngoscopy(idLaryngoscopy),
    foreign key (idEEG) references triage.EEG(idEEG),
    foreign key (idKawasaki) references triage.kawasaki(idKawasaki),
    foreign key (idLong_distance_care) references triage.long_distance_care(idLong_distance_care),
    foreign key (idPatient) references triage.audio_video_DGPR(idPatient)
);

insert into triage.entry(accept_DGPR)
values (true), (true), (true), (false), (true),
       (true), (true), (true), (false), (true);
insert into triage.patient(idAccept_DGPR)
values (1), (2), (3), (5),
       (6), (7), (8), (10);
insert into triage.weight(patientWeight, idPatient)
values (101, 1), (89,2),(29, 3),
       (89,4), (38, 5), (65, 6),
       (49, 7), (93, 8);
insert into triage.height(height, idPatient)
values (101, 1), (189,2), (129, 3),
       (189,4), (138, 5), (165, 6),
       (149, 7), (193, 8);
insert into triage.temperature(entry_temperature_check, half_temperature_check, final_temperature_check, idPatient)
VALUES (39.3, 39, 36.7, 1),
       (38.3, 39.2, 40, 2),
       (38.2, 39.3, 40.7, 3),
       (38.1, 39.1, 40.2, 4),
       (39.9, 39.9, 36.8, 5),
       (39.4, 39, 36.9, 6),
       (45.1, 39.2, 36.6, 7),
       (39.9, 39.1, 36.7, 8);
insert into triage.personal_data(personal_identification_code, first_name, last_name, place_of_birth, date_of_birth, current_address, validityId, insurence_code, idPatient)
VALUES (237907,'Ruby','Gulliany','Kazahstan',19871210,'Slovenia, Ubjei ulitze 5',true, 0988, 1),
       (2387187,'Jan', 'De-La-Coada-Vacii', 'Undeva Departe', 20001201, 'Sus pe strada nr.2', true, 9009938, 2),
       (8271837,'Jonny','Drago','Bibilica Veche',19991103, 'Copacei de munte', true,364748,3),
       (7218947,'Scuzi', 'Lambada', 'Jovvanni Buri', 20010523, 'Joja West', true, 848475, 4),
       (87214,'Ruy','Guany','Kazahstan',191210,'Bulai, Ubjei ulit 4',true, 64646, 5),
       (832486,'Janse', 'Deacii', 'Undeva Departe', 20001201, 'Susschi str nr.2', true, 9045, 6),
       (372487,'Joy','Dgo','Bibilche',191103, 'Copaunte', true,36454,7),
       (7482843,'Scuzdedi', 'Lamda', 'Jovvuri', 200103, 'Joja West', true, 8445475, 8);
insert into triage.high_risk (riskValue)
values (10), (8), (7), (9);
insert into triage.low_risk (riskValue)
values (1), (5), (2), (0);
