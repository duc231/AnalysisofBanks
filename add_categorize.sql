ALTER TABLE `analysis_bankStock`.`dimCompany` 
ADD COLUMN `categorize` VARCHAR(45) NULL AFTER `industry`;
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'ABB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'ACB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Đầu tư và phát triển' WHERE (`ticker` = 'BAB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'BID');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'BVB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'CTG');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'EIB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'EVF');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'HDB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'KLB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'LPB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'MBB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'MSB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'NAB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'NVB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'OCB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'PGB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'SGB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'SHB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'SSB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'STB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'TCB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'TPB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Đầu tư và phát triển' WHERE (`ticker` = 'VAB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Chứng khoán' WHERE (`ticker` = 'VBB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'VCB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Đầu tư và phát triển' WHERE (`ticker` = 'VIB');
UPDATE `analysis_bankStock`.`dimCompany` SET `categorize` = 'Thương mại' WHERE (`ticker` = 'VPB');

