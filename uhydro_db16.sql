-- --------------------------------------------------------
-- Host:                         sql628.your-server.de
-- Server version:               5.7.32-1 - (Debian)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for uhydro_db16
CREATE DATABASE IF NOT EXISTS `uhydro_db16` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `uhydro_db16`;

-- Dumping structure for table uhydro_db16.borehole
CREATE TABLE IF NOT EXISTS `borehole` (
  `borehole_id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) NOT NULL,
  `medsal_code` varchar(128) NOT NULL,
  `projection` varchar(128) NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `altitude` double NOT NULL,
  `date` datetime NOT NULL,
  `level` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`borehole_id`),
  UNIQUE KEY `borehole_id` (`borehole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Dumping structure for table uhydro_db16.characteristics
CREATE TABLE IF NOT EXISTS `characteristics` (
  `id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `monitoring` binary(1) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double DEFAULT NULL,
  `aquifer_code` varchar(128) NOT NULL,
  `aquifer_type` varchar(128) NOT NULL,
  `thickness` double NOT NULL,
  `distance_sea` double NOT NULL,
  `drilling_date` datetime NOT NULL,
  `drilling_type` varchar(128) NOT NULL,
  `status` enum('pumped','observation') NOT NULL,
  `level_creation` double NOT NULL,
  `tds_creation` double NOT NULL,
  `lithostratigraphy` enum('yes','no') NOT NULL,
  `pumping_test` enum('yes','no') NOT NULL,
  `transmissivity` double NOT NULL,
  `specific_yield` double NOT NULL,
  `storativity` double NOT NULL,
  `permability` double NOT NULL,
  `property` enum('public','private') NOT NULL,
  `water_use` enum('agriculture','domestic','industrial','other') NOT NULL DEFAULT 'agriculture',
  `contact` varchar(256) NOT NULL,
  `storage_coef` double NOT NULL DEFAULT '0',
  `thickness_well_head` double DEFAULT NULL,
  `specific_capacity` double DEFAULT NULL,
  `hydr_cond` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.characteristics: ~1 rows (approximately)
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` (`id`, `name`, `monitoring`, `national_code`, `medsal_code`, `projection`, `utm_x`, `utm_y`, `latitude`, `longitude`, `altitude`, `aquifer_code`, `aquifer_type`, `thickness`, `distance_sea`, `drilling_date`, `drilling_type`, `status`, `level_creation`, `tds_creation`, `lithostratigraphy`, `pumping_test`, `transmissivity`, `specific_yield`, `storativity`, `permability`, `property`, `water_use`, `contact`, `storage_coef`, `thickness_well_head`, `specific_capacity`, `hydr_cond`) VALUES
	(1, 'Samos', _binary 0x32, '1111', '1111', 'UTM', 22, 0, 23, 40, 5, 'Q', 'unconfined', 20, 500, '2019-12-02 14:44:00', 'dug', 'pumped', -1, 1500, 'yes', 'no', 0.0001, 30, 0.0001, 0.00005, 'public', 'industrial', 'NN', 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Climatic_data
CREATE TABLE IF NOT EXISTS `Climatic_data` (
  `id` int(10) unsigned NOT NULL,
  `station_id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `Time_step` enum('Day','Hour','Min10','Min','Sec') NOT NULL DEFAULT 'Day',
  `date` datetime NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `solar_radiation` double NOT NULL,
  `Air_temp_mean` double NOT NULL,
  `Air_temp_min` double NOT NULL,
  `Air_temp_max` double NOT NULL,
  `Wind_speed` double NOT NULL,
  `Evaporation` double NOT NULL,
  `Relative_humidity` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Climatic_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Climatic_data` DISABLE KEYS */;
INSERT INTO `Climatic_data` (`id`, `station_id`, `name`, `national_code`, `medsal_code`, `Time_step`, `date`, `utm_x`, `utm_y`, `projection`, `altitude`, `solar_radiation`, `Air_temp_mean`, `Air_temp_min`, `Air_temp_max`, `Wind_speed`, `Evaporation`, `Relative_humidity`, `notes`) VALUES
	(1, 0, 'clim', 'gr', 'gr-001', '', '2020-09-16 00:00:00', 11, 9, 'utm', 111, 8, 8, 5, 8, 78, 9, 89, 'none');
/*!40000 ALTER TABLE `Climatic_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Gauging_characteristics
CREATE TABLE IF NOT EXISTS `Gauging_characteristics` (
  `id` int(10) NOT NULL,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `type` enum('meterologic','rainfall','runoff') NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `draining_surface` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Gauging_characteristics: ~0 rows (approximately)
/*!40000 ALTER TABLE `Gauging_characteristics` DISABLE KEYS */;
INSERT INTO `Gauging_characteristics` (`id`, `name`, `national_code`, `medsal_code`, `type`, `utm_x`, `utm_y`, `projection`, `altitude`, `draining_surface`, `notes`) VALUES
	(1, 'Well 6', 'GR', 'GR-001', 'runoff', 111, 111, 'UTM', 111, 43, 'none');
/*!40000 ALTER TABLE `Gauging_characteristics` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Geochemical
CREATE TABLE IF NOT EXISTS `Geochemical` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `sampling_type` enum('pumping','bailers') NOT NULL,
  `depth_sampling` double NOT NULL,
  `depth_pump` double NOT NULL,
  `date` datetime NOT NULL,
  `temperature` double NOT NULL,
  `pH_field` double NOT NULL,
  `pH_lab` double NOT NULL,
  `Eh` double NOT NULL,
  `EC_field` double NOT NULL,
  `EC_lab` double NOT NULL,
  `TH` double NOT NULL,
  `DO` double NOT NULL,
  `TOC` double NOT NULL,
  `DOC` double NOT NULL,
  `Na` double NOT NULL,
  `Ca` double NOT NULL,
  `Mg` double NOT NULL,
  `K` double NOT NULL,
  `Cl` double NOT NULL,
  `Br` double NOT NULL,
  `Fe_tot` double NOT NULL,
  `HCO3` double NOT NULL,
  `CO3` double NOT NULL,
  `SO4` double NOT NULL,
  `NO3` double NOT NULL,
  `PO4` double NOT NULL,
  `Si` double NOT NULL,
  `Sr` double NOT NULL,
  `F` double NOT NULL,
  `B` double NOT NULL,
  `Li` double NOT NULL,
  `TDS` double NOT NULL,
  `Cn` double NOT NULL,
  `Fe2p` double NOT NULL,
  `Cr_tot` double NOT NULL,
  `Cd` double NOT NULL,
  `Al` double NOT NULL,
  `Cu` double NOT NULL,
  `Sn` double NOT NULL,
  `Zn` double NOT NULL,
  `As` double NOT NULL,
  `Mo` double NOT NULL,
  `Co` double NOT NULL,
  `Br2` double NOT NULL,
  `Ba` double NOT NULL,
  `Ag` double NOT NULL,
  `Be` double NOT NULL,
  `NO2` double NOT NULL,
  `Ni` double NOT NULL,
  `Se` double NOT NULL,
  `Hg` double NOT NULL,
  `Pb` double NOT NULL,
  `Ti` double NOT NULL,
  `Fe3p` double NOT NULL,
  `Cr3` double NOT NULL,
  `Cr6` double NOT NULL,
  `Sb` double NOT NULL,
  `Mn` double NOT NULL,
  `HSm` double NOT NULL,
  `Im` double NOT NULL,
  `Cs` double NOT NULL,
  `NH4p` double DEFAULT NULL,
  `SIO2` float DEFAULT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Geochemical: ~0 rows (approximately)
/*!40000 ALTER TABLE `Geochemical` DISABLE KEYS */;
/*!40000 ALTER TABLE `Geochemical` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.ICPMS_and_ASS_data
CREATE TABLE IF NOT EXISTS `ICPMS_and_ASS_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `date` datetime NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `sample_type` enum('soil','sediment') NOT NULL,
  `altitude` double DEFAULT NULL,
  `sampling_depth` double NOT NULL,
  `Al` double NOT NULL,
  `As` double NOT NULL,
  `Cd` double NOT NULL,
  `Co` double NOT NULL,
  `Cr` double NOT NULL,
  `Cu` double NOT NULL,
  `Fe` double NOT NULL,
  `Hg` double NOT NULL,
  `Mn` double NOT NULL,
  `Mo` double NOT NULL,
  `Ni` double NOT NULL,
  `Pb` double NOT NULL,
  `Sb` double NOT NULL,
  `Se` double NOT NULL,
  `Sn` double NOT NULL,
  `Ti` double NOT NULL,
  `Zn` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.ICPMS_and_ASS_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `ICPMS_and_ASS_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ICPMS_and_ASS_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Isotopes
CREATE TABLE IF NOT EXISTS `Isotopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) NOT NULL,
  `altitude` double NOT NULL,
  `date` datetime NOT NULL,
  `Temperature` double NOT NULL,
  `TDS` double NOT NULL,
  `Electric_conductivity` double NOT NULL,
  `TH` double NOT NULL,
  `dO18` double NOT NULL,
  `d2H` double NOT NULL,
  `d13C` double NOT NULL,
  `d87Sr` double NOT NULL,
  `d11B` double NOT NULL,
  `d14S` double NOT NULL,
  `d15N` double NOT NULL,
  `C14pmc` double NOT NULL,
  `tritium` double NOT NULL,
  `Krypton85` double NOT NULL,
  `Chlorine36` double NOT NULL,
  `SF6` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Isotopes: ~0 rows (approximately)
/*!40000 ALTER TABLE `Isotopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Isotopes` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Lithostratigraphic_data
CREATE TABLE IF NOT EXISTS `Lithostratigraphic_data` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Top_m_bg` double NOT NULL,
  `Bottom_m_bg` double NOT NULL,
  `Thickness_m` double NOT NULL,
  `Top_m_AMSL` double NOT NULL,
  `Bottom_m_AMSL` double NOT NULL,
  `Description` enum('crs Sst','C','S','CS','mSst','MassLs','FracDol') NOT NULL,
  `Aquifer_analog` enum('Unsaturated zone','Surface aquifer','Aquitard','Aquifer','Main Aquifer') NOT NULL,
  `Equipment_of_the_Well` enum('Casing','Screen') NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Lithostratigraphic_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Lithostratigraphic_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lithostratigraphic_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Pumping_test_data
CREATE TABLE IF NOT EXISTS `Pumping_test_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `type` enum('long-term','short-term','sequential tests') DEFAULT NULL,
  `pumping_rate` double DEFAULT NULL,
  `time_step` enum('Day','Hour','Min10','Min','Sec') DEFAULT 'Day',
  `date` datetime DEFAULT NULL,
  `draw_down` double DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Pumping_test_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Pumping_test_data` DISABLE KEYS */;
INSERT INTO `Pumping_test_data` (`id`, `name`, `national_code`, `medsal_code`, `utm_x`, `utm_y`, `projection`, `type`, `pumping_rate`, `time_step`, `date`, `draw_down`, `notes`) VALUES
	(21, 'Mersin', '1112', '2001', 23, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `Pumping_test_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Rainfall_data
CREATE TABLE IF NOT EXISTS `Rainfall_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(10) unsigned NOT NULL,
  `name_Meteo_station` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `time_step` enum('Day','Hour','Min10','Min','Sec') NOT NULL DEFAULT 'Day',
  `date` datetime NOT NULL,
  `Rain_fall` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Rainfall_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Rainfall_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rainfall_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Runoff_data
CREATE TABLE IF NOT EXISTS `Runoff_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int(10) unsigned NOT NULL,
  `name_gauing_station` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `time_step` enum('Day','Hour','Min10','Min','Sec') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Day',
  `date` datetime NOT NULL,
  `river_flow` double NOT NULL,
  `stage` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Runoff_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Runoff_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Runoff_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Soil_data_physicochemical
CREATE TABLE IF NOT EXISTS `Soil_data_physicochemical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `date` datetime NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `sample_type` enum('Soil','Sediment') NOT NULL,
  `altitude` double DEFAULT NULL,
  `sampling_depth` enum('0-30cm','30-150cm','>150cm') NOT NULL,
  `EC` double NOT NULL,
  `pH` double NOT NULL,
  `Eh` double NOT NULL,
  `NO3` double NOT NULL,
  `NO2` double NOT NULL,
  `PO4` double NOT NULL,
  `CaCO3_pc` double NOT NULL,
  `Organic_Matter_pc` double NOT NULL,
  `Cation_exchange_capacity` double NOT NULL,
  `Sand_pc` double NOT NULL,
  `Silt_pc` double NOT NULL,
  `Clay_pc` double NOT NULL,
  `Soil_class` varchar(128) NOT NULL,
  `k_permeability_calculated` double NOT NULL,
  `Lab_K_Hyd_Cond` double NOT NULL,
  `Insitu_K_saturated_Hyd_Cond_Kfs` double NOT NULL,
  `Insitu_K_Test_Depth` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Soil_data_physicochemical: ~0 rows (approximately)
/*!40000 ALTER TABLE `Soil_data_physicochemical` DISABLE KEYS */;
/*!40000 ALTER TABLE `Soil_data_physicochemical` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Well_chemical_analysis
CREATE TABLE IF NOT EXISTS `Well_chemical_analysis` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `sample_type` enum('pumping','static') NOT NULL,
  `TC` double NOT NULL,
  `pH` double NOT NULL,
  `EC` double NOT NULL,
  `TDS` double NOT NULL,
  `Ca2p` double NOT NULL,
  `Mg2p` double NOT NULL,
  `Nap` double NOT NULL,
  `Kp` double NOT NULL,
  `Clm` double NOT NULL,
  `HCO3m` double NOT NULL,
  `CO3m` double NOT NULL,
  `SO4m` double NOT NULL,
  `NH4p` double NOT NULL,
  `NO3m` double NOT NULL,
  `NO2m` double NOT NULL,
  `SAR` varchar(128) NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Well_chemical_analysis: ~0 rows (approximately)
/*!40000 ALTER TABLE `Well_chemical_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `Well_chemical_analysis` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.Well_data
CREATE TABLE IF NOT EXISTS `Well_data` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `well_code` varchar(128) NOT NULL,
  `MEDx` varchar(128) NOT NULL,
  `well_elevation` double NOT NULL,
  `water_level_m_bg` double NOT NULL,
  `water_level_m_AMSL` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.Well_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `Well_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `Well_data` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.XRD_Mineralogy
CREATE TABLE IF NOT EXISTS `XRD_Mineralogy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `date` datetime NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `sample_type` enum('soil','sediment') NOT NULL,
  `altitude` double DEFAULT NULL,
  `sampling_depth` double NOT NULL,
  `Calcite` double NOT NULL,
  `Dolomite` double NOT NULL,
  `Quartz` double NOT NULL,
  `Feldspar` double NOT NULL,
  `Mica` double NOT NULL,
  `Serpentine` double NOT NULL,
  `Clay` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.XRD_Mineralogy: ~0 rows (approximately)
/*!40000 ALTER TABLE `XRD_Mineralogy` DISABLE KEYS */;
/*!40000 ALTER TABLE `XRD_Mineralogy` ENABLE KEYS */;

-- Dumping structure for table uhydro_db16.XRF_Geochemical
CREATE TABLE IF NOT EXISTS `XRF_Geochemical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `national_code` varchar(128) DEFAULT NULL,
  `medsal_code` varchar(128) DEFAULT NULL,
  `date` datetime NOT NULL,
  `utm_x` double NOT NULL,
  `utm_y` double NOT NULL,
  `projection` varchar(128) DEFAULT NULL,
  `sample_type` enum('soil','sediment') NOT NULL,
  `altitude` double DEFAULT NULL,
  `sampling_depth` double NOT NULL,
  `CaOpc` double NOT NULL,
  `MgOpc` double NOT NULL,
  `K2Opc` double NOT NULL,
  `Na2Opc` double NOT NULL,
  `SiO2pc` double NOT NULL,
  `TiO2` double NOT NULL,
  `Clpc` double NOT NULL,
  `P2O5pc` double NOT NULL,
  `SO3pc` double NOT NULL,
  `Fe2O3` double NOT NULL,
  `MnO` double NOT NULL,
  `ZnO2` double NOT NULL,
  `Cr2O3` double NOT NULL,
  `Al2O3pc` double NOT NULL,
  `Co2O3` double NOT NULL,
  `NiO` double NOT NULL,
  `SrO` double NOT NULL,
  `PbO` double NOT NULL,
  `Loss_Ignition_pcw` double NOT NULL,
  `notes` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table uhydro_db16.XRF_Geochemical: ~0 rows (approximately)
/*!40000 ALTER TABLE `XRF_Geochemical` DISABLE KEYS */;
/*!40000 ALTER TABLE `XRF_Geochemical` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
