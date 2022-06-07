
-- add Category
INSERT INTO `o_car`.`category` (`categ_name`, `categ_company`) VALUES ('쏘나타', '현대');
INSERT INTO `o_car`.`category` (`categ_name`, `categ_company`) VALUES ('그랜저', '현대');
INSERT INTO `o_car`.`category` (`categ_name`, `categ_company`) VALUES ('팰리세이드', '현대');

-- add user
INSERT INTO `o_car`.`user` (`user_id`, `user_name`, `user_pw`, `user_phone`, `user_email`, `user_address`, `created_date`, `user_role`) 
	VALUES ('qwe', 'qwer', '1234', '01012345678', 'qwe123@naver.com', '서울특별시 노원구 광운로 20', '2022-05-03', '0');
INSERT INTO `o_car`.`user` (`user_id`, `user_name`, `user_pw`, `user_phone`, `user_email`, `user_address`, `created_date`, `user_role`) 
	VALUES ('asd', 'asdf', '1234', '01012345678', 'asd@naver.com', '서울특별시 노원구 광운로 20', '2022-05-04', '1');
INSERT INTO `o_car`.`user` (`user_id`, `user_name`, `user_pw`, `user_phone`, `user_email`, `user_address`, `created_date`, `user_role`) 
	VALUES ('zxc', 'zxcv', '1234', '01012345678', 'zxc@naver.com', '서울특별시 노원구 광운로 20', '2022-05-05', '1');
INSERT INTO `o_car`.`user` (`user_id`, `user_name`, `user_pw`, `user_phone`, `user_email`, `user_address`, `created_date`, `user_role`) 
	VALUES ('wer', 'wert', '1234', '01012345678', 'wer@naver.com', '서울특별시 노원구 광운로 20', '2022-05-05', '2');

-- add car
INSERT INTO `o_car`.`car` (`category_id`, `seller_id`, `car_title`, `car_price`, `car_year`, `car_mileage`, `car_fuel`, `car_info`, `created_date`, `hit`) 
	VALUES ('2', 'asd', '그랜저', '2000', '2015', '10', '가솔린', '비고1', '2022-05-06', '0');
INSERT INTO `o_car`.`car` (`category_id`, `seller_id`, `car_title`, `car_price`, `car_year`, `car_mileage`, `car_fuel`, `car_info`, `created_date`, `hit`) 
	VALUES ('3', 'zxc', '팰리세이드', '1500', '2020', '11', '디젤', '비고2', '2022-05-07', '0');

-- add favorite
INSERT INTO `o_car`.`favorite` (`user_id`, `car_id`) 
	VALUES ('qwe', '2');

-- add order
INSERT INTO `o_car`.`order` (`car_id`, `buyer_id`, `purchase_date`) 
	VALUES ('2', 'qwe', '2022-05-14');
    
-- add company
INSERT INTO `o_car`.`company` (`name`, `info`) VALUES ('주)회사1', '비고1');
UPDATE `o_car`.`user` SET `Company_id` = '1' WHERE (`user_id` = 'wer');



